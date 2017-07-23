module Json

  class Channel < Base

    class << self

      def channels
        self.new.all
      end

      def default_channel
        channels['default'] || nil
      end

      def notifications_channel
        channels['notifications'] || nil
      end

      def working_channel
        channels['working'] || nil
      end

    end

  end

end
