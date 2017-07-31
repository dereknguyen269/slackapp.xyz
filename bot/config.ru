require ::File.expand_path('../config/environment', __FILE__)
# require ::File.expand_path('../bot/iron_man', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot/commands/base', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot/commands/calculate', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot/commands/hi', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot/commands/hello', __FILE__)
# require ::File.expand_path('../lib/slack_ruby_bot/support/commands_helper.rb', __FILE__)

Thread.abort_on_exception = true
Thread.new do
  IronMan.run
end

run Rails.application
