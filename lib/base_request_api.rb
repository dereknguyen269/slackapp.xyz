require 'uri'
require 'json'
require 'net/http'
require 'net/https'

class BaseRequestApi

  ALL     = %w(GET POST PUT PATCH DELETE)
  GET     = %w(GET get)
  POST    = %w(POST post)
  PUT     = %w(PUT put)
  PATCH   = %w(PATCH patch)
  DELETE  = %w(DELETE delete)

  class << self

    def resource(name, klass)
      define_method(name) do
        klass.new(self)
      end
    end

  end

  def initialize(base_params = self.class::BASE_PARAMS)
    @base_params = base_params
  end

  def merged_params(params)
    return params unless @base_params.present?
    params.is_a?(Hash) ? @base_params.merge(params) : @base_params
  end

  def merged_enpoint(endpoint, mendpoint)
    mendpoint.blank? ? endpoint : "#{endpoint}/#{mendpoint}"
    # http://endpoint.com/:address?type=payment&limit=10
  end

  def merged_header(header)
    return {'Content-Type' => 'application/json'} if header.blank?
    return {'Content-Type' => 'application/json'}.merge(header)
  end

  def init_http(method, endpoint, header, params, body)
    uri = URI.parse(current_enpoint(method, endpoint, params))
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.read_timeout = 60
    req = Net::HTTP::Post.new(uri.request_uri, merged_header(header)) if post?(method)
    req = Net::HTTP::Get.new(uri.request_uri, merged_header(header)) if get?(method)
    req.body = body.to_json
    res = https.request(req)
    res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body) : {}
  end

  def json_get(endpoint, header = {}, params = {}, body = {}, mendpoint = '')
    init_http('GET', merged_enpoint(endpoint, mendpoint), header, merged_params(params), body)
  end

  def json_post(endpoint, header = {}, params = {}, body = {}, mendpoint = '')
    init_http('POST', merged_enpoint(endpoint, mendpoint), header, merged_params(params), body)
  end

  private

    def current_enpoint(method, endpoint, params)
      return endpoint if post?(method)
      if get?(method)
        if params.is_a? Hash
          if params.present?
            return "#{endpoint}?#{params.to_param}"
          else
            return endpoint
          end
        end
        return "#{endpoint}/#{params.to_s}" if params.is_a?(String) || params.is_a?(Integer)
      end
    end

    ALL.each do |type|
      class_eval <<-METHODS, __FILE__, __LINE__ + 1
        def #{type.underscore}?(input)
          #{type}.include?(input)
        end
      METHODS
    end

end
