class AddCarToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :make, :string
    add_column :requests, :model, :string
    add_column :requests, :model_year, :integer
  end
end
