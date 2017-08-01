# == Schema Information
#
# Table name: api_services
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  api_url    :string           default(""), not null
#  app_id     :string           default(""), not null
#  token      :string           default(""), not null
#  secret     :string           default(""), not null
#  status     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiService < ActiveRecord::Base
end
