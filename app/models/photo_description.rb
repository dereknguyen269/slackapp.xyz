# == Schema Information
#
# Table name: photo_descriptions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PhotoDescription < ActiveRecord::Base

end
