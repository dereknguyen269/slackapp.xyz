class IronMan::SendMessageToChannelService < IronMan::BaseService

  def initialize(channel = '#test', message = 'No message :joy:')
    @channel = channel
    @message = message
    @ironman = self.class.ironman
  end

  def call
    @ironman.chat_postMessage(channel: @channel, text: @message, as_user: true)
    STDERR.puts "Send message to #{@channel} has been successfully!"
    true
  rescue
    STDERR.puts "Can not sending message to #{@channel}"
    false
  end
end
