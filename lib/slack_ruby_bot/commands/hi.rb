module SlackRubyBot
  module Commands
    class Hi < Base
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "Hello <@#{data.user}>!", gif: 'hello')
      end
    end
  end
end
