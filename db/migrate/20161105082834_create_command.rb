class CreateCommand < ActiveRecord::Migration[4.2]
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.string :message, null: false
      t.timestamps null: false
    end
  end
end
