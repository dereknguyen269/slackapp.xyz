puts "load bot config"

Dir[Rails.root.join('bot/*.rb')].each{|rb| require rb}
Dir[Rails.root.join('lib/slack_ruby_bot.rb')].each{|rb| require rb}
Dir[Rails.root.join('lib/slack_ruby_bot/*.rb')].each{|rb| require rb}
