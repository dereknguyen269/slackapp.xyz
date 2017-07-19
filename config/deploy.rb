lock '3.8.2'

# application name
set :application, 'slackbot'

# deploy directory on the server. Will be ie: '/var/www/slackbot_production'
set :deploy_to, -> { "/var/www/#{fetch(:application)}_#{fetch(:stage)}" }

# capistrano will download an app from "master" branch of this repository:
set :repo_url, 'git@github.com:minhquan4080/slack-bot.git'

# change to ruby version you need
set :rvm_type, :auto                    # Defaults to: :auto
set :rvm_ruby_version, '2.3.1'          # Defaults to: 'default'
# set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected


