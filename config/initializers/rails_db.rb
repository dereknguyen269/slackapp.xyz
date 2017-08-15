if Object.const_defined?('RailsDb')
  RailsDb.setup do |config|
    # # enabled or not
    # config.enabled = Rails.env.development?

    # # automatic engine routes mounting
    # config.automatic_routes_mount = true

    # set tables which you want to hide ONLY
    # config.black_list_tables = ['users', 'accounts']

    # set tables which you want to show ONLY
    # config.white_list_tables = ['posts', 'comments']

    # # Enable http basic authentication
    config.http_basic_authentication_enabled = true

    # # Enable http basic authentication
    config.http_basic_authentication_user_name = ENV['RAILS_DB_USER']

    # # Enable http basic authentication
    config.http_basic_authentication_password = ENV['RAILS_DB_PASS']

    # # Enable http basic authentication
    # config.verify_access_proc = proc { |controller| true }
  end
end