class AddTowOrSmithToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tow, :boolean
    add_column :users, :smith, :boolean
  end
end
