class CreatePhotoKeywords < ActiveRecord::Migration
  def change
    create_table :photo_keywords do |t|
      t.string :keyword, null: false

      t.timestamps null: false
    end
  end
end
