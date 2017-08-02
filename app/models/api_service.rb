# == Schema Information
#
# Table name: api_services
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  status     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  api_url    :string
#

class ApiService < ActiveRecord::Base
  has_many :api_service_infos, :foreign_key => :api_services_id, class_name: 'ApiServiceInfo'
  accepts_nested_attributes_for :api_service_infos, reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: true, presence: true
  validates :api_url, uniqueness: true, presence: true
end
