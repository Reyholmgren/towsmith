class AddProviderIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :provider_id, :integer
  end
end
