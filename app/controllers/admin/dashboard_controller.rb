class Admin::DashboardController < Admin::BaseController
  before_action :prepare_client

  def index
    @channels = @client.channels_list.channels
  end

  def create
    message = message_params[:message]
    channel = message_params[:channel]
    channel = '#test' if channel.blank?
    if !message.blank?
      @client.chat_postMessage(channel: channel, text: message, as_user: true)
      flash[:notice] = "Message was successfully send to channel: #{channel}"
    end
    redirect_to action: :index
  end

  private

  def prepare_client
    @client = Slack::Web::Client.new(token: Base64Helper.new(ENV['TOKEN'], ENV['SECRET_STR']).decode)
  end

  def message_params
    params.require(:message).permit(:message, :channel)
  end

end
