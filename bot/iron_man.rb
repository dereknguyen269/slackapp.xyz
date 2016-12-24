class IronMan < SlackRubyBot::Bot
  @id = 0

  def self.next_id
    @id = @id % 10 + 1
  end

  command 'say' do |client, data, match|
    Rails.cache.write next_id, { text: match['expression'] }
    client.say(channel: data.channel, text: match['expression'])
  end

  command "What time is it?", "What’s the time?", "What time ?" do |client, data, match|
    client.say(channel: data.channel, text: Time.now)
  end

  command "Where are you from ?", 'Where are you from', 'Where are u from' do | client, data, match |
    client.say(channel: data.channel, text: 'The Avengers')
  end

  command 'ask:', 'ask' do |client, data, match|
    question = match['expression']
    cmds = Command.search_for(question)
    if cmds.count.zero?
      message = "I don't know. Please ask another question!"
    else
      message = cmds.sample.message
    end
    client.say(channel: data.channel, text: message)
  end

end
