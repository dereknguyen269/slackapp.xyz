# == Schema Information
#
# Table name: api_service_infos
#
#  id             :integer          not null, primary key
#  app_name       :string           not null
#  app_id         :string           not null
#  app_secret     :string           not null
#  app_token      :string
#  status         :integer          default("deactive"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  api_service_id :integer
#
# Indexes
#
#  index_api_service_infos_on_api_service_id  (api_service_id)
#

class ApiServiceInfo < ApplicationRecord
  belongs_to :api_service

  enum status: %i(deactive active)
end
