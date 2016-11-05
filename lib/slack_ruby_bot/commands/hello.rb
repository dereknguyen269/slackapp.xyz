module SlackRubyBot
  module Commands
    class Hello < Base
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "hi <@#{data.user}>!", gif: 'hi')
      end
    end
  end
end