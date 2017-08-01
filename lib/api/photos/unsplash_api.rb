module Api::Photos

  # API_ENDPOINT  = 'https://api.unsplash.com'
  # API_APP_ID = ''

  class SearchPhoto < Api::Photos::UnsplashBaseClient
    # ENDPOINT = "#{API_ENDPOINT}/search/photos".freeze
    PARAM_KEY = :search_photo
    BASE_PARAMS = {page: 1, query: 'rose'}.freeze
  end

  class UnsplashApi < BaseRequestApi
    BASE_PARAMS = {}.freeze

    resource :search_photo, SearchPhoto
  end

end
