class SayGoodMorningSerivce

  def call
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#test', text: 'Good moring @channel', as_user: true)
  end

end
