ActionCable.server.config do |config|
  config.redis_path = Rails.root('config/cable.yml')
  config.allowed_request_origins = ['http://rubyonrails.com', /http:\/\/ruby.*/]
  config.log_tags = [
      -> request { request.env['bc.account_id'] || "no-account" },
      :action_cable,
      -> request { request.uuid }
    ]
end
