class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :total_amount
      t.float :total_price
      t.belongs_to :good
      t.references :trader, polymorphic: true
      t.timestamps null: false
    end
  end
end
