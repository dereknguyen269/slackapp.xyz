class RemoveColumnApiServiceInfos < ActiveRecord::Migration[5.1]
  def change
    remove_column :api_service_infos, :api_services_id, :integer
  end
end
