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

  class Test < Api::Instagram::BaseApi
    PARAM_KEY = :test

    def call
      if service
        {success: 'Instagram API work fine!'}
      else
        {error: 'Instagram API do not work'}
      end
    end
  end

  class UserMediaFeed < Api::Instagram::BaseApi
    PARAM_KEY = :user_media_feed

    def call
      if service
        medias = service.user_recent_media
        get_image_url(medias) unless medias.count.zero?
      else
        {error: 'Instagram API do not work'}
      end
    end

    def get_image_url(medias)
      media = medias.sample
      a_index = medias.index(media)
      image = media&.images
      url = image&.standard_resolution&.url
      caption = media&.caption&.text
      flag = false
      if url.present?
        flag = true
      end
      if !flag
        medias.delete_at(a_index)
        get_image_url(medias)
      end
      {url: url, caption: caption}
    end
  end

  class InstagramApi < BaseRequestApi
    BASE_PARAMS = {}.freeze
    resource :authorize, AccessToken
    resource :test, Test
    resource :user_media_feed, UserMediaFeed
  end
end
