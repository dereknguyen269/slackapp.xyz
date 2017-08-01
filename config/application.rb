require File.expand_path('../boot', __FILE__)

require_relative 'all'
require_relative 'database_hardcore'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SlackBotOnRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Asia/Ho_Chi_Minh'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.default_locale = :en
    config.autoload_paths += %W(#{config.root}/lib)
    config.active_job.queue_adapter = :sidekiq

    config.browserify_rails.paths << /vendor\/assets\/javascripts\/module\.js/
    config.browserify_rails.source_map_environments << "development"
    config.browserify_rails.evaluate_node_modules = true
    # config.browserify_rails.force = ->(file) { File.extname(file) == ".ts" }
    # config.browserify_rails.commandline_options = ["-t browserify-shim", "--fast"]
    # config.browserify_rails.commandline_options = "-t browserify-shim --fast"
    # config.browserify_rails.node_env = "production"
  end
end
