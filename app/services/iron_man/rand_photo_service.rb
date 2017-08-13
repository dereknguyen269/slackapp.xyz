require 'rubygems'
require 'nokogiri'
require 'open-uri'

class IronMan::RandPhotoService < IronMan::BaseService

  class << self

    def call
      caption = 'Ngắm gái tí nào anh em :joy: '
      photo = 'https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/20582547_1939995162950134_1873222055978074112_n.jpg'
      api_services = ApiService.where(status: true)

      unless api_services.count.zero?
        api_service = api_services.first
        if api_service.name.include?('Instagram')
          post = Api::RandomPhotoService.call('instagram')
          caption = post[:caption]
          photo = post[:url]
          RandomPhotoLog.create!(url: photo)
        end
      end

      message = "#{caption} #{photo}"
      channel = Json::Channel.working_channel
      IronMan::SendMessageToChannelService.new(channel, message).call
    rescue
      raise "IronMan::RandPhotoService is down."
    end

  end

end
