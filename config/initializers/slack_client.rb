SlackRubyBot.configure do |config|
  config.aliases = [':ironman:', 'ironman']
  config.token = Base64Helper.new(ENV['TOKEN'], ENV['SECRET_STR']).decode
end

