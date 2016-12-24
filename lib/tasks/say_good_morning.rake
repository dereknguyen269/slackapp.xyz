task :say_good_morning do
  uri = URI.parse('https://ironman-slackbot.herokuapp.com/admin')
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data(channel: '#test', message: 'Good morning @channel')
  response = http.request(request)
end
