require 'open-uri'
require 'net/http'

namespace :wake_up do
  task :run => :environment do
    if ENV['WEB_URL']
      uri = URI(ENV['WEB_URL'])
      Net::HTTP.get_response(uri)
      puts "Wake up at #{Time.current}"
    end
  end
end
