# == Schema Information
#
# Table name: commands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  message    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Command < ActiveRecord::Base
  scoped_search on: [:name]
end
