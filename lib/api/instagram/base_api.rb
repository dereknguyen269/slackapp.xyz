module Api::Instagram
  include Rails.application.routes.url_helpers

  class BaseApi

    def initialize(client)
      @client = client
      @api_info = api_info
      @callback_url = callback_url
      @current_access_token = current_access_token
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

  end
end
