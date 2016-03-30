class CreateDeliverHistories < ActiveRecord::Migration
  def change
    create_table :deliver_histories do |t|
      t.integer :amount
      t.timestamps null: false
    end
  end
end
