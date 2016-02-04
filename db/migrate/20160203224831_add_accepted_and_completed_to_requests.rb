class AddAcceptedAndCompletedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :accepted, :boolean
    add_column :requests, :completed, :boolean
  end
end
