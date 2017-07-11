require 'open-uri'
require 'net/http'

namespace :wake_up do
  task :run => :environment do
    if ENV['WEB_URL']
      uri = URI.parse("#{ENV['WEB_URL']}/users/sign_in")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      current_time = Time.current.strftime('%a, %d %b %G %T %Z %z')
      channel = ChannelsJsonModel.notifications_channel
      message = response&.code == "200" ? "Wake up has been successfully at #{current_time}" : "Wake up has been failed at #{current_time}"
      IronMan::SendMessageToChannelService.new(channel, message).call
    end
  end
end
