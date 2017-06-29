class IronMan::BaseService
  class << self

    def ironman
      Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
    end

  end
end