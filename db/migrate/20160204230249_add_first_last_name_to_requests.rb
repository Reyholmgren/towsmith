class AddFirstLastNameToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :first_name, :string
    add_column :requests, :last_name, :string
  end
end
