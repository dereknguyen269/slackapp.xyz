class IronMan::SendMessageToChannelService < IronMan::BaseService

  def initialize(channel = '#test', message = 'No message :joy:', as_test = false)
    @channel = channel
    @message = message
    @as_test = as_test
    @ironman = self.class.ironman
  end

  def call
    @ironman.chat_postMessage(channel: @channel, text: @message, as_user: true) unless @as_test
    STDERR.puts "Send message to #{@channel} has been successfully!"
    true
  rescue
    STDERR.puts "Can not sending message to #{@channel}"
    false
  end
end
