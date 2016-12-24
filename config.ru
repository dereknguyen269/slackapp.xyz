# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require ::File.expand_path('../bot/iron_man', __FILE__)

Thread.abort_on_exception = true
Thread.new do
  IronMan.run
end

run Rails.application
