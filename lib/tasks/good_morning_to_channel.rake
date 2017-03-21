require 'open-uri'

namespace :good_morning_to_channel do
  task :run => :environment do
    uri = URI.parse("#{ENV['WEB_URL']}/admin/auto/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    message = "Good morning everybody :sun_with_face:"
    request.set_form_data(channel: 'test', message: message)
    response = http.request(request)
  end
end
