require 'rubygems'
require 'nokogiri'
require 'open-uri'

class IronMan::RandPhotoService < IronMan::BaseService

  class << self

    def call
      api_services = ApiService.where(status: true)
      if api_services.count.zero?
        original_call
        return
      else
        api_service = api_services.first
        if api_service.name.include?('Instagram')
          post = Api::RandomPhotoService.call('instagram')
          caption = post[:caption]
          photo = post[:url]
          RandomPhotoLog.create!(url: post)
        end
      end

      photo = 'https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/20582547_1939995162950134_1873222055978074112_n.jpg' unless photo

      unless caption
        caption = PhotoDescription.all.count > 0 ? PhotoDescription.all.sample.description : ('Yêu cmnr :beauty:' || 'Chỉ là test thôi mà :joy:')
      end

      message = "#{caption} #{photo}"
      channel = Json::Channel.working_channel
      IronMan::SendMessageToChannelService.new(channel, message).call
    end

    def original_call
      photo = get_photo
      has_desc = false
      if photo.present?
        has_desc = true
      else
        photo_keywords = PhotoKeyword.all
        if photo_keywords.count.zero?
          params = {}
        else
          params = {query: photo_keywords.sample.keyword}
        end
        photo_from_api = Api::RandomPhotoService.call('unsplash', params)
        if photo_from_api.present?
          photo = photo_from_api
        else
          photo = 'http://68.media.tumblr.com/ecc20a97d9de4d23c59180844b29ce78/tumblr_o96ty07hHF1qadv0oo1_500.jpg'
          has_desc = true
        end
      end
      desc = PhotoDescription.all.count > 0 ? PhotoDescription.all.sample.description : ('Yêu cmnr :beauty:' || 'Chỉ là test thôi mà :joy:')
      if has_desc
        message = "#{desc} #{photo}"
      else
        message = photo
      end
      channel = Json::Channel.working_channel
      IronMan::SendMessageToChannelService.new(channel, message).call
    end

    private

      def get_photo
        photo = from_xkcn
        photo.sample
      end

      def get_doc(path)
        user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
        Nokogiri::HTML.parse(open(path, {'User-Agent' => user_agent}))
      end

      def from_xkcn
        attr_photo = PhotoAttr.find_or_create_by!(name: 'article.photo', site: 'xkcn.info')
        photo = []
        page_number = page_need_crawler
        if page_number
          doc = get_doc("http://xkcn.info/page/#{page_number}")
          doc.css(attr_photo.name).each do |item|
            img = item.at_css('img')
            photo << img['src']
          end
        else
          index = 1
          flag = true
          while flag do
            doc = get_doc("http://xkcn.info/page/#{index}")
            doc.css(attr_photo.name).each do |item|
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

end
