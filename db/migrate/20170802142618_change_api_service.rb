class ChangeApiService < ActiveRecord::Migration
  def change
    remove_column :api_services, :app_id, :string
    remove_column :api_services, :token, :string
    remove_column :api_services, :secret, :string
    remove_column :api_services, :api_url, :string
  end
end
