class AddUserTypeToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :user_type, :integer
  end
end
