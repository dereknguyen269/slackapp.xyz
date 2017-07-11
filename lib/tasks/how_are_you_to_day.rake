require 'open-uri'

namespace :how_are_you_to_day do
  task :run => :environment do
    channel = ChannelsJsonModel.working_channel
    message = "How are you to day ? :big-smile:"
    IronMan::SendMessageToChannelService.new(channel, message).call
  end
end
