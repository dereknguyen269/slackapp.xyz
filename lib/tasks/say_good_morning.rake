task :say_good_morning do
  uri = URI.parse('https://safe-beyond-85886.herokuapp.com/admin')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.set_form_data(channel: '#test', message: 'Good morning @channel')
  response = http.request(request)
  puts Nokogiri::HTML(response.body)
end
