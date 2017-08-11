class CreateApiServices < ActiveRecord::Migration[4.2]
  def change
    create_table :api_services do |t|
      t.string :name, null: false, default: ''
      t.string :api_url, null: false, default: ''
      t.string :app_id, null: false, default: ''
      t.string :token, null: false, default: ''
      t.string :secret, null: false, default: ''
      t.boolean :status,null: false, default: false

      t.timestamps null: false
    end
  end
end
