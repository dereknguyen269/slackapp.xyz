require 'slack-ruby-client'
require_relative '../../base64_helper'

namespace :slackbot do

  desc "Slacbot Notify Deployed"
  task :notify_deployed do
    STDERR.puts "Slacbot Notify Deployed running..."
    @ironman = Slack::Web::Client.new(token: Base64Helper.new(ENV['TOKEN'], ENV['SECRET_STR']).decode)
    @ironman.chat_postMessage(channel: '#ironman-notify', text: 'Oh yeah :tada: :tada: I have been deployed new version :heart_eyes:', as_user: true)
  end

end
