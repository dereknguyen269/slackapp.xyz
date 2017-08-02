class ChangeApiServiceInfo < ActiveRecord::Migration
  def change
    remove_column :api_service_infos, :api_service_id, :integer
  end
end
