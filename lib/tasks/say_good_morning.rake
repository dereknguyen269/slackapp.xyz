task :say_good_morning do
  uri = URI.parse("#{ENV['WEB_URL']}/admin/auto/")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.set_form_data(channel: 'wtf', message: 'Good morning channel')
  response = http.request(request)
end
