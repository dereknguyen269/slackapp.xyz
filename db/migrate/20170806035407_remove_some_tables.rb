class RemoveSomeTables < ActiveRecord::Migration
  def change
    drop_table :photo_descriptions
    drop_table :photo_attrs
  end
end
