lock "3.8.2"

set :application, ENV['APP_NAME']

set :repo_url, ENV['REPO_URL']

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, -> { "/var/www/#{fetch(:application)}_#{fetch(:stage)}" }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for keep_releases is 5
set :keep_releases, 5

set :ssh_options, {
 forward_agent: true
}

set :deploy_via, :remote_cache
set :use_sudo, false

server ENV['SERVER_IP'], user: ENV['DEPLOY_USER'], roles: %w(app web db), :primary => true

# If use Unicorn as web server
# after 'deploy:publishing', 'deploy:restart'

# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:reload'
#   end
# end

# Staging
# after :deploy, 'prepare:staging'
# after :'prepare:staging', 'docker:build'

# Production & Development
after :deploy, 'prepare:development'
after :'prepare:development', 'docker:stop'
after :'docker:stop', 'docker:build'
after :'docker:build', 'docker:setup_db'
after :'docker:setup_db', 'docker:up'
