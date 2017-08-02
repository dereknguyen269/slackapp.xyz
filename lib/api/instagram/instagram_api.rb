module Api::Instagram

  class AccessToken < Api::Instagram::BaseApi
    PARAM_KEY = :authorize

    def call
      if @api_info
        endpoint = "#{api_info['api_url']}/oauth/authorize/"
        params = {
          client_id: @api_info['app_id'],
          redirect_uri: @callback_url,
          response_type: 'code'
        }
        # res = @client.json_get(endpoint, params)
        {error: 'Pending feature!'}
      else
        {error: 'Instagram API service not found!'}
      end
    end
  end

  class InstagramApi < BaseRequestApi
    BASE_PARAMS = {}.freeze
    resource :authorize, AccessToken
  end
end
