require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'rake'
namespace :send_photo_to_channel do
  task :run => :environment do
    photo = get_photo
    if photo.blank?
      photo = 'http://68.media.tumblr.com/ecc20a97d9de4d23c59180844b29ce78/tumblr_o96ty07hHF1qadv0oo1_500.jpg'
    end
    uri = URI.parse("#{ENV['WEB_URL']}/admin/auto/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    desc = PhotoDescription.all.count > 0 ? PhotoDescription.all.sample.description : ('Yêu cmnr :beauty:' || 'Chỉ là test thôi mà :joy:')
    message = "#{desc} #{photo}"
    request.set_form_data(channel: 'wtf', message: message)
    response = http.request(request)
  end

  def get_photo
    photo = from_xkcn
    photo.sample
  end

  def get_doc(path)
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
    Nokogiri::HTML.parse(open(path, {'User-Agent' => user_agent}))
  end

  def from_xkcn
    photo = []
    page_number = page_need_crawler
    if page_number
      doc = get_doc("http://xkcn.info/page/#{page_number}")
      doc.css('article.post.photo').each do |item|
        img = item.at_css('img')
        photo << img['src']
      end
    else
      index = 1
      flag = true
      while flag do
        doc = get_doc("http://xkcn.info/page/#{index}")
        doc.css('article.post.photo').each do |item|
          photo << item['src']
        end
        index += 1
        # If you dont want export all image from website
        if index == 10
          flag = false
        end
      end
    end
    photo
  end

  def page_need_crawler
    t = Time.now
    day = t.strftime("%d").to_i
    wday = t.wday
    if wday % 2 == 0
      page = day * 2
    else
      page = day
    end
    page
  end

end
