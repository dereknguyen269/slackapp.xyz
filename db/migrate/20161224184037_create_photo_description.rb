class CreatePhotoDescription < ActiveRecord::Migration
  def change
    create_table :photo_descriptions do |t|
      t.string :description, null: ''
      t.timestamps null: false
    end
  end
end
