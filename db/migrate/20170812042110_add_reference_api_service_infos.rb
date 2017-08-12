class AddReferenceApiServiceInfos < ActiveRecord::Migration[5.1]
  def change
    add_reference :api_service_infos, :api_service
  end
end
