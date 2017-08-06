module Profile
  extend ActiveSupport::Concern

  included do

    def profile_name
      username || email
    end

  end
end
