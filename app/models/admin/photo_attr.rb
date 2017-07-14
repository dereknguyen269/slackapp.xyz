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

class Admin::PhotoAttr < PhotoAttr
end
