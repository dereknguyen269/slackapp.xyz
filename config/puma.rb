require ::File.expand_path('../environment', __FILE__)

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

enabled_bot =  ENV['ENABLED_BOT'] || 'false'

on_worker_boot do
  ActiveRecord::Base.establish_connection
  IronMan.run if enabled_bot == 'true' # Starting Slackbot when enabled
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
