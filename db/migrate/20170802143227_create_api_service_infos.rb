class CreateApiServiceInfos < ActiveRecord::Migration
  def change
    create_table :api_service_infos do |t|
      t.string :app_name, null: false
      t.string :app_id, null: false
      t.string :app_secret, null: false
      t.string :app_token
      t.integer :status, null: false, default: 0
      t.integer :api_service_id, null: false
      t.belongs_to :api_services, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
