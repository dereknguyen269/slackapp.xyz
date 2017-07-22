class IronMan::BaseService
  class << self

    def ironman
      Slack::Web::Client.new(token: Base64Helper.new(ENV['TOKEN'], ENV['SECRET_STR']).decode)
    end

  end
end
