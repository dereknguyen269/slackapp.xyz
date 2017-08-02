# == Schema Information
#
# Table name: instagram_tokens
#
#  id         :integer          not null, primary key
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InstagramToken < ActiveRecord::Base
end
