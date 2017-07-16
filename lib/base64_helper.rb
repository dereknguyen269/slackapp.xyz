require "base64"

class Base64Helper

  EMPTY = 'need_config_slack_token_api_and_your_secret_string'

  def initialize(key, secret)
    @key = key
    @secret = secret
  end

  def encode
    Base64.encode64(convert)
  end

  def decode
    Base64.decode64(reverse_convert) if @key != EMPTY
  rescue
    EMPTY
  end

  private

    def convert
      key = Base64.encode64(@key)
      secret = Base64.encode64(@secret)
      str = "#{secret.reverse}#{key.reverse}"
      "begin_secret_key:#{str.reverse}:end_secret_key"
    end

    def reverse_convert
      return EMPTY if @key.nil? || @secret.nil?
      str = Base64.decode64(@key.gsub("\\n", "\n"))
      str = str.gsub('begin_secret_key:', '')
      str = str.gsub(':end_secret_key', '')
      str = str.reverse
      reverse_secret = Base64.encode64(@secret).reverse
      str = str.gsub(reverse_secret, '')
      str.reverse
    end

end
