# == Schema Information
#
# Table name: photo_keywords
#
#  id         :integer          not null, primary key
#  keyword    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoKeyword < ApplicationRecord
end
