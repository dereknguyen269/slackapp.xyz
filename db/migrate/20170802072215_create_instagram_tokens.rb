class CreateInstagramTokens < ActiveRecord::Migration
  def change
    create_table :instagram_tokens do |t|
      t.string :token, null: false

      t.timestamps null: false
    end
  end
end
