class CreateRandomPhotoLogs < ActiveRecord::Migration
  def change
    create_table :random_photo_logs do |t|
      t.string :url, null: false
      t.timestamps null: false
    end
  end
end
