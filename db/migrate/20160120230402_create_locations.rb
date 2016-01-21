class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :street
      t.string :zip
      t.belongs_to :provider
      t.belongs_to :request

      t.timestamps null: false
    end
  end
end
