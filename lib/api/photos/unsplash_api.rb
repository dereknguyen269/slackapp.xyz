module Api::Photos

  API_ENDPOINT  = 'https://api.unsplash.com'
  UNSPLASH_API_APP_ID = 'aef097a6112097cf203852d66eae3d94f7921f73597ded2bf3a54907f6c358e2'

  class SearchPhoto < Api::Photos::UnsplashBaseClient
    ENDPOINT = "#{API_ENDPOINT}/search/photos".freeze
    PARAM_KEY = :search_photo
    BASE_PARAMS = {client_id: UNSPLASH_API_APP_ID, page: 1, query: 'rose'}.freeze
  end

  class UnsplashApi < BaseRequestApi
    BASE_PARAMS = {}.freeze

    resource :search_photo, SearchPhoto
  end

end
