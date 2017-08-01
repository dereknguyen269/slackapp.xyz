lock "3.9.0"

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

# Default value for keep_releases is 5
set :keep_releases, 5

set :ssh_options, {
 forward_agent: true
}

server ENV['SERVER_IP'], user: ENV['DEPLOY_USER'], roles: %w(app web db), :primary => true

# Production & Development

if ENV['DATABASE_URL'].blank?
  after :deploy, 'prepare:development'
  after :'prepare:development', 'docker:build'
  after :'docker:build', 'docker:up'
  after :'docker:up', 'docker:setup_db'
  after :'docker:setup_db', 'slackbot:notify_deployed'
else
  after :deploy, 'prepare:development'
  after :'prepare:development', 'docker:export_env'
  after :'docker:export_env', 'docker:build'
  after :'docker:build', 'docker:up'
  after :'docker:up', 'slackbot:notify_deployed'
end
