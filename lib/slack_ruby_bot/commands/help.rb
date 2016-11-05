module SlackRubyBot
  module Commands
    class HelpCommand < Base
      command 'help' do |client, data, match|
        command = '-cmd'

        text = general_text if command == '-cmd'
        text = 'Please use `help -cmd`' if command != '-cmd'

        client.say(channel: data.channel, text: text, gif: 'command')
      end

      class << self
        private

        def general_text
          <<TEXT
Commands:
- say `word`
- `What time is it?`
- `Where are you from ?`
- ask `An question`

Please ask with Libra. Thanks :)
TEXT
        end
      end
    end
  end
end
