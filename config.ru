# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

enabled_bot = ENV['ENABLED_BOT'] || false
enabled_bot = ActiveRecord::Type::Boolean.new.type_cast_from_user(enabled_bot)

Thread.abort_on_exception = true
Thread.new do
  if enabled_bot
    puts "---IronMan Starting-------"
    IronMan.run
  else
    puts "---Don't start IronMan-------"
  end
end

run Rails.application
