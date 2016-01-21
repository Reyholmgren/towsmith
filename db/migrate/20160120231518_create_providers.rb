class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :type
      t.string :phone
      t.integer :ratings
      t.integer :total_rating

      t.timestamps null: false
    end
  end
end
