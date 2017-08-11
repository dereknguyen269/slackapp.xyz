class RemoveInstagramTokenTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :instagram_tokens
  end
end
