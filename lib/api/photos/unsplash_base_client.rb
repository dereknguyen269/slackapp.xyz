module Api::Photos

  class UnsplashBaseClient
    def initialize(client)
      @client = client
      @api_service_info = get_api_service_info
    end

    def find_by(params = {})
      endpoint = "#{@api_service_info.api_url}/search/photos".freeze
      params = self.class::BASE_PARAMS.merge(params)
      @client.json_get(endpoint, params.merge(client_id: @api_service_info.app_id))
    end

    private

      def get_api_service_info
        info = ApiService.find_by(name: 'UnsplashApi', status: true)
        if info.present?
          info
        else
          raise 'Missing UnsplashApi API Service Information!'
        end
      end
  end

end
