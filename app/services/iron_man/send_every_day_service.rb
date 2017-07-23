class IronMan::SendEveryDayService < IronMan::BaseService

  class << self

    def call
      message = current_message || "Không biết nói gì hết :joy:"
      channel = Json::Channel.working_channel
      IronMan::SendMessageToChannelService.new(channel, message).call
    end

    private

      def current_message
        now   = Time.current
        hour = now.hour

        if now.monday?
          return begning_of_the_week if morning?(hour)
        end

        if now.friday?
          return end_of_friday if afternoon?(hour)
        end

        if now.saturday?
          return morning_of_saturday if morning?(hour)
        end

        return good_morning if morning?(hour)
        return end_of_the_day if afternoon?(hour)
      end

      def morning?(hour)
        hour > 5 && hour < 11
      end

      def night?(hour)
        hour > 9 && hour < 23
      end

      def afternoon?(hour)
        hour > 14 && hour < 19
      end

      def good_morning
        "Good morning everybody :sun_with_face:"
      end

      def end_of_the_day
        "How are you today? :big-smile:"
      end

      def end_of_friday
        "Nice weekend guys :laughing:"
      end

      def morning_of_saturday
        "Cuối tuần mọi người có đi đâu chơi hem :smile:"
      end

      def begning_of_the_week
        "Chúc mọi người một tuần mới làm việc thật hiểu quả nha :heart:"
      end
  end

end
