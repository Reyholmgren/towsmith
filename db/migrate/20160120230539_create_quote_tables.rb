class CreateQuoteTables < ActiveRecord::Migration
  def change
    create_table :quote_tables do |t|
      t.string :desc
      t.float :price
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
