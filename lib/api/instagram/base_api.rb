module Api::Instagram
  include Rails.application.routes.url_helpers

  class BaseApi

    def initialize(client)
      @client = client
      @api_info = api_info
      @callback_url = callback_url
      @current_access_token = current_access_token
      @service = get_service
    end

    def api_info
      ApiService.find_by(name: 'InstagramApi', status: true)
    end

    def callback_url
      Rails.application.routes.url_helpers.callback_instagram_index_url
    end

    def current_access_token
      InstagramToken.last&.token
    end

    def service
      @service ||= get_service
    end

    private

      def get_service
        Instagram.client(:access_token => @current_access_token)
      rescue
        raise 'Failed to connect Instagram API!'
      end

  end
end
