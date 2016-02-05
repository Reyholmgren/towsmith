class AddLatLonToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :lat, :float
    add_column :requests, :lon, :float
    add_column :requests, :address, :string
  end
end
