require 'nokogiri'
require 'open-uri'
require 'phantomjs'
require 'json'
require 'base64'

class GetlinkController < ApplicationController
  layout 'login'

  PHANTOMJS_DIR = Rails.root.join('app', 'assets', 'javascripts', 'phantomjs').to_s
  PHANTOMJS_GET_DIR = Rails.root.join('tmp', 'phantomjs').to_s

  SUPPORT_SITES = %w( javhd.pro )
  VIDEO_PLAYERS = %w( jwplayer )

  def index
    render :new
  end

  def new
  end

  def create
    url_needed = get_link_params[:url].to_param
    uri = URI.parse(url_needed)
    host = uri.host
    unless SUPPORT_SITES.include?(host)
      flash[:notice] = "Sorry! Currently, we do not support #{host}."
      redirect_to :action => 'index'
      return
    end
    js_file = [PHANTOMJS_DIR, 'getlink.js.erb'].join('/')
    Phantomjs.run(js_file, url_needed) do |response|
      STDERR.puts response.inspect
    end
    tmp_html_path = [PHANTOMJS_GET_DIR, 'first-screen.html'].join('/')
    json_data_path = [PHANTOMJS_GET_DIR, 'data.json'].join('/')
    doc = open_html_file(tmp_html_path)
    video_player = find_video_player(doc)
    case video_player
    when 'jwplayer'
      json_data = with_jwplayer(doc)
      json_data = json_format(json_data)
      File.open(json_data_path, "w+") do |f|
        f.write(json_data)
      end
    end
    data = File.read(json_data_path)
    @title = get_title(doc)
    @your_link = url_needed
    @thumb = find_thumb_video(doc)
    @video = find_video_information_from_json(data)
    flash[:notice] = 'Get link has been successfully!'
  end

  private

    def get_link_params
      params.require(:getlink).permit(:url)
    end

    def get_doc(path)
      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
      Nokogiri::HTML.parse(open(path, {'User-Agent' => user_agent}))
    end

    def open_html_file(path)
      Nokogiri::HTML(open(path))
    end

    def find_video_player(doc)
      VIDEO_PLAYERS.each do |video_player|
        result = doc.search "[text()*='#{video_player}']"
        return video_player unless result.count.zero?
      end
    end

    def with_jwplayer(doc)
      doc.css("script").each do |node|
        text =  node.text
        if text.include?('jwplayer') && text.include?('sources')
          json_data = text.match( /{.+}/ )[0]
          return json_data if json_data
        end
      end
    end

    def json_format(json_data)
      json_data = json_data.gsub('image', '"image"') if include?('image')
      json_data = json_data.gsub('sources', '"sources"') if include?('sources')
      json_data = json_data.gsub('file', '"file"') if include?('file')
      json_data = json_data.gsub('window.atob(', '') if include?('window.atob(')
      json_data = json_data.gsub(')', '') if include?(')')
      json_data = json_data.gsub('default', '"default"') if include?('default')
      json_data = json_data.gsub('{"image": "/jwplayer/loading.jpg","sources": ', '') if include?('{"image": "/jwplayer/loading.jpg","sources": ')
      json_data << "]"
      json_data
    end

    def find_video_information_from_json(json_data)
      objs =  JSON.parse(json_data)
      infos = []
      objs.each do |item|
        infos << {
          file: Base64.decode64(item['file'].to_s),
          label: item['label'],
          type: item['type']
        }
      end
      infos
    end

    def find_thumb_video(doc)
      if doc.css('img.thumb')
        src = doc.css('img.thumb')[0]["src"].to_param
        if src.split('?')[1]
          ps = src.split('?')[1].split('=')
          return ps.last if ps.last && validate_image(ps.last)
        end
      end
    end

    def validate_image(string)
      string.match /[\w:]+\.(jpe?g|png|gif)/i
    end

    def get_title(doc)
      doc.at_css('title').text
    end

end
