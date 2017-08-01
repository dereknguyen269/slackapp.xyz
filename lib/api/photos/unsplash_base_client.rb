require 'uri'
module Api::Photos
  class UnsplashBaseClient
    def initialize(client)
      @client = client
    end

    def find_by(params = {})
      params = self.class::BASE_PARAMS.merge(params)
      @client.json_get(self.class::ENDPOINT, params)
    end
  end
end