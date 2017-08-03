module Api::Instagram
  include Rails.application.routes.url_helpers

  class BaseApi

    def initialize(client)
      @client = client
      @instagram_app = instagram_apps.sample
      @instagram_app_id = @instagram_app.app_id
      @instagram_app_secret = @instagram_app.app_secret
      @callback_url = callback_url
      @current_access_token = current_access_token
      @service = get_service
    end

    def callback_url
      Rails.application.routes.url_helpers.callback_instagram_index_url
    end

    def current_access_token
      @instagram_app&.app_token
    end

    def service
      @service ||= get_service
    end

    private

      def get_service
        Instagram.configure do |config|
          config.client_id = @instagram_app_id
          config.client_secret = @instagram_app_secret
        end
        Instagram.client(:access_token => @current_access_token)
      rescue
        raise 'Failed to connect Instagram API!'
      end

      def instagram_apps
        apis = ApiService.where(name: 'Instagram API')
        api_services = []
        if apis.count > 0
          arr = apis.select{|item| item.status == true}
          arr.each do |item|
            api_services = api_services + item.api_service_infos.select{|info| info.active?}
          end
        end
        api_services
      end

  end
end
