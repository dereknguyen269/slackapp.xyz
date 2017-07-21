require 'sidekiq/scheduler'

redis_setting = {
  url: ENV['REDIS_URL']
}

Sidekiq.configure_server do |config|
  config.redis = redis_setting
  # config.server_middleware do |chain|
  #   chain.add Sidekiq::Middleware::Server::RetryJobs, max_retries: 0
  # end
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path("../../../config/scheduler.yml", __FILE__))
    Sidekiq::Scheduler.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_setting
end
