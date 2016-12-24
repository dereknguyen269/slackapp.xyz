class Admin::DashboardController < Admin::BaseController
  before_action :prepare_client

  def index
    @channels = @client.channels_list.channels
  end

  def create
    message = message_params[:message]
    channel = message_params[:channel]
    channel = '#test' if channel.blank?
    @client.chat_postMessage(channel: '#test', text: message, as_user: true) unless message.blank?
    redirect_to action: :index
  end

  private

  def prepare_client
    @client = Slack::Web::Client.new
  end

  def message_params
    params.require(:message).permit(:message, :channel)
  end

end
