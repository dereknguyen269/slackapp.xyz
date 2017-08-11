class AddApiUrlToApiServices < ActiveRecord::Migration[4.2]
  def change
    add_column :api_services, :api_url, :string
  end
end
