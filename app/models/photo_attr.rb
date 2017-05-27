# == Schema Information
#
# Table name: photo_attrs
#
#  id         :integer          not null, primary key
#  name       :string
#  site       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoAttr < ActiveRecord::Base
  validates :name, presence: true
  validates :site, presence: true
  validates :site, uniqueness: true
end
