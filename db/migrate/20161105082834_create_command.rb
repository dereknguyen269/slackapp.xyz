class CreateCommand < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.string :message, null: false
      t.timestamps null: false
    end
  end
end
