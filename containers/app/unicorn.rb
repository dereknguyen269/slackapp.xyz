rails_root = File.expand_path('../../', __FILE__)
rails_env = ENV['RAILS_ENV'] || "development"

worker_processes 2
preload_app true
timeout 30
working_directory rails_root

listen "#{rails_root}/tmp/sockets/unicorn.sock"
pid "#{rails_root}/tmp/pids/unicorn.pid"
listen 8080, :tcp_nopush => true

stderr_path "#{rails_root}/log/#{rails_env}_unicorn_error.log"
stdout_path "#{rails_root}/log/#{rails_env}_unicorn.log"
