require 'open-uri'

namespace :how_are_you_to_day do
  task :run => :environment do
    uri = URI.parse("#{ENV['WEB_URL']}/admin/auto/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    message = "How are you to day ?"
    request.set_form_data(channel: 'wtf', message: message)
    response = http.request(request)
  end
end
