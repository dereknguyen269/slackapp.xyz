# == Schema Information
#
# Table name: random_photo_logs
#
#  id         :integer          not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RandomPhotoLog < ActiveRecord::Base
end
