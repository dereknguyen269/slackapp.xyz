class RemoveSomeTables < ActiveRecord::Migration[4.2]
  def change
    drop_table :photo_descriptions
    drop_table :photo_attrs
  end
end
