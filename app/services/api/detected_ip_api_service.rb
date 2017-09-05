module Api

  class DetectedIpApiService < BaseRequestApi
    FREEGEOIP_API_ENDPOINT = 'https://freegeoip.io'.freeze

    def initialize(base_params = {})
      @base_params = base_params
    end

    def json_response
      api_endpoint = "#{FREEGEOIP_API_ENDPOINT}/json/".freeze
      res = json_get(api_endpoint)
      res.blank? ? {'ip' => nil, 'latitude' => '', 'longitude' => ''} : res
    end
  end

end
