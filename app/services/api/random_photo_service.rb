module Api

  class RandomPhotoService < BaseApiService

    PHOTO_APIS = %w(unsplash instagram)
    DEFAULT_PHOTO = 'https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/20582547_1939995162950134_1873222055978074112_n.jpg'.freeze

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

        def instagram_api(params)
          res = Api::Instagram::InstagramApi.new.user_media_feed.call
          photo = RandomPhotoLog.find_by(url: res[:url])
          flag = true unless photo
          if !flag
            instagram_api
            exit
          end
          res
        end

    end

  end

end
