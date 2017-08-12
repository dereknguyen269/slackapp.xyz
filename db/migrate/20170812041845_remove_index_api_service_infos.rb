class RemoveIndexApiServiceInfos < ActiveRecord::Migration[5.1]
  def change
    remove_index :api_service_infos, :api_services_id
  end
end
