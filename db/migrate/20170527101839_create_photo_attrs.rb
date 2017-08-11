class CreatePhotoAttrs < ActiveRecord::Migration[4.2]
  def change
    create_table :photo_attrs do |t|
      t.string :name
      t.string :site
      t.timestamps null: false
    end
  end
end
