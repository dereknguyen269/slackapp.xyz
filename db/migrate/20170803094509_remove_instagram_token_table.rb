class RemoveInstagramTokenTable < ActiveRecord::Migration
  def change
    drop_table :instagram_tokens
  end
end
