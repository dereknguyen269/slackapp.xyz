source 'https://rubygems.org'

gem 'rails', '~> 4.2', '>= 4.2.9'
# Use Postgres as the database for Active Record
gem 'pg'
# Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'sprockets', '>=3.0.0.beta'
gem 'sprockets-es6'
gem 'clipboard-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

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
gem 'slim-rails', '~> 3.1.0'
gem 'twitter-bootstrap-rails'
gem "font-awesome-rails"
gem 'bootstrap-sass', '~> 3.3.6'

# User authentication and authorization
gem 'devise', '~> 4.3.0'
gem 'rolify'
gem 'pundit'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-instagram'

# Support gems
gem 'instagram', :git => 'git://github.com/facebookarchive/instagram-ruby-gem.git'

# Config
gem 'figaro'

# Third party
gem 'rails_db'
gem 'colorize'

# Calculate
gem 'dentaku'

# Search
gem "scoped_search"

# Crawler
gem 'nokogiri', '1.8.0'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# ActiveJob
gem 'sidekiq'
gem 'sidekiq-scheduler'

# Same as Rails 5+
gem 'actionpack', '~> 4.2', '>= 4.2.9'
gem 'activejob', '~> 4.2', '>= 4.2.9'

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

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background.
  gem "spring"
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Auto deploy with capistrano
group :development do
  gem "capistrano", "~> 3.8"
  gem 'capistrano-figaro'
end
