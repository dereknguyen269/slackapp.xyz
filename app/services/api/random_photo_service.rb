module Api

  class RandomPhotoService < BaseApiService

    PHOTO_APIS = %w(unsplash)
    DEFAULT_PHOTO = 'http://68.media.tumblr.com/ecc20a97d9de4d23c59180844b29ce78/tumblr_o96ty07hHF1qadv0oo1_500.jpg'.freeze

    class << self

      def call(api_name = nil, params = {})
        handle_api(api_name, params)
      end

      private

        def handle_api(api_name, params)
          if self::PHOTO_APIS.include? api_name
            send :"#{api_name}_api", params
          else
            send :unsplash_api, params
          end
        rescue
          self::DEFAULT_PHOTO
        end

        def unsplash_api(params)
          res = Api::Photos::UnsplashApi.new.search_photo.find_by(params)
          if res && !res['results'].count.zero?
            random = res['results'].sample
            unless random['urls']&.count.zero?
              random['urls']['raw']&.to_s
            end
          end
        end
    end

  end

end
