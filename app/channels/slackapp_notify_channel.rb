class SlackappNotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "slackapp_notify_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "slackapp_notify_channel", data
  end
end
