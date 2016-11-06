module SlackRubyBot
  module Commands
    class Help < Base
      command 'help' do |client, data, match|
        if match.names.include?('expression')
          if match[:expression] == '-cmd'
            text =
            <<TEXT
Commands:
- ironman `say word`
- ironman `What time is it?`
- ironman `Where are you from ?`
- ironman `ask An question`

Please ask with Libra. Thanks :)
TEXT
          end
        else
          text = 'Please use `help -cmd`'
        end
        client.say(channel: data.channel, text: text, gif: 'command')
      end
    end
  end
end
