class AddApiUrlToApiServices < ActiveRecord::Migration
  def change
    add_column :api_services, :api_url, :string
  end
end
