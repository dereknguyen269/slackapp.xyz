# == Schema Information
#
# Table name: api_service_infos
#
#  id              :integer          not null, primary key
#  app_name        :string           not null
#  app_id          :string           not null
#  app_secret      :string           not null
#  app_token       :string
#  status          :integer          default(0), not null
#  api_services_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_api_service_infos_on_api_services_id  (api_services_id)
#

class ApiServiceInfo < ActiveRecord::Base
  belongs_to :api_services, :foreign_key => :api_services_id

  enum status: %i(deactive active)
end
