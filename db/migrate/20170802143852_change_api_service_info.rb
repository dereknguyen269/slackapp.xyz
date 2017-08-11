class ChangeApiServiceInfo < ActiveRecord::Migration[4.2]
  def change
    remove_column :api_service_infos, :api_service_id, :integer
  end
end
