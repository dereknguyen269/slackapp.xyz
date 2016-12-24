module SlackRubyBot
  class CommandsHelper

    def bot_desc_and_commands
      collect_help_attrs(bot_help_attrs) do |help_attrs|
        bot_commands_descs = collect_name_and_desc(help_attrs.commands)
        "#{command_name_and_desc(help_attrs)}\n\n*Commands:*\n#{bot_commands_descs.join("\n")}"
      end
    end

    def other_commands_descs
      collect_name_and_desc(other_commands_help_attrs)
    end

    def command_full_desc(name)
      unescaped_name = Slack::Messages::Formatting.unescape(name)
      help_attrs = find_command_help_attrs(unescaped_name)
      return "There's no command *#{unescaped_name}*" unless help_attrs
      return "There's no description for command *#{unescaped_name}*" if help_attrs.command_long_desc.blank?
      "#{command_name_and_desc(help_attrs)}\n\n#{help_attrs.command_long_desc}"
    end

  end

end
