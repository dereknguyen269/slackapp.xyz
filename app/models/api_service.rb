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

class ApiService < ApplicationRecord
  has_many :api_service_infos, :foreign_key => :api_services_id, class_name: 'ApiServiceInfo'
  accepts_nested_attributes_for :api_service_infos, allow_destroy: true

  validates :name, uniqueness: true, presence: true
  validates :api_url, uniqueness: true, presence: true
  validates :api_service_infos, :presence => { :message => 'there should be at least one' }

  def has_info?
    !api_service_infos.count.zero?
  end

  def avaible?
    self.status
  end

  def single?
    api_service_infos&.count == 1
  end

  def single
    api_service_infos.first if single?
  end
end
