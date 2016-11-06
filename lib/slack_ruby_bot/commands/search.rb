module SlackRubyBot
  module Commands
    class Search < Base
      def self.call(client, data, _match)
        text =
        <<TEXT
Use:
- say `search web key-word`
Or,
Please ask with Libra. Thanks :)
TEXT
        client.say(channel: data.channel, text: text)
      end
    end
  end
end
