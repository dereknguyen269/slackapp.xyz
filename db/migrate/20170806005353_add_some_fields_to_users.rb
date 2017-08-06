class AddSomeFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: true
    add_column :users, :avatar, :string, null: true
  end
end
