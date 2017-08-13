source 'https://rubygems.org'

gem 'rails', '~> 5.1', '>= 5.1.3'
# Use Postgres as the database for Active Record
gem 'pg'
# Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.3.18', '< 0.5'

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'sprockets'
gem 'sprockets-es6'

# Slack Bot
gem 'slack-ruby-bot'
gem 'celluloid-io'
gem 'slack-ruby-client'

# Form builders & helpers
gem 'simple_form'
gem 'cocoon'

# Upload media
gem 'carrierwave', '~> 1.0'

# Front-end
gem 'slim-rails', '~> 3.1.2'
gem 'twitter-bootstrap-rails'
gem "font-awesome-rails", '~> 4.7.0.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'clipboard-rails'
gem 'toastr-rails', '~> 1.0.3'

# User authentication and authorization
gem 'devise', '~> 4.3.0'
gem 'rolify'
gem 'pundit'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-instagram'
gem 'warden'

# Support gems
gem 'instagram'

# Config
gem 'figaro'

# Third party
gem 'colorize'
gem 'rails_db', '~> 1.6.0'

# Calculate
gem 'dentaku'

# Search
gem "scoped_search"

# Crawler
gem 'nokogiri', '1.8.0'

# Use Puma as the app server
gem 'puma', '~> 3.9.1'

# ActiveJob
gem 'sidekiq'
gem 'sidekiq-scheduler'

# Store files in Rails applications
# gem "activestorage", git: "https://github.com/rails/activestorage.git"

# Table print in console
gem 'hirb'

# Calling Go code
gem 'quartz'

# Others
gem 'annotate'
gem 'email_detected'
gem 'gemoji'
gem 'better_errors'
gem 'binding_of_caller'

# Manage Procfile
gem 'foreman'

gem 'rspec-rails', '3.6.0'
gem 'listen'

group :development do
  gem 'web-console', '~> 2.3.0'
  gem "spring"
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'pry-rails'
  gem 'railroady'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'timecop'
  gem 'webmock'
end

group :production do
  gem 'therubyracer'
end

group :development do
  # Auto deploy with capistrano
  gem "capistrano", "~> 3.9"
  gem 'capistrano-figaro'
end
