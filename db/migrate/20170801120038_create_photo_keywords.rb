class CreatePhotoKeywords < ActiveRecord::Migration[4.2]
  def change
    create_table :photo_keywords do |t|
      t.string :keyword, null: false

      t.timestamps null: false
    end
  end
end
