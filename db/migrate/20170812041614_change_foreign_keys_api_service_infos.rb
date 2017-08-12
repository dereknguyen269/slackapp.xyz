class ChangeForeignKeysApiServiceInfos < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :api_service_infos, :api_services
  end
end
