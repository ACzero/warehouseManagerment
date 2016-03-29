class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.integer :type, default: 0
      t.string :origin
      t.string :store
      t.belongs_to :good
      t.integer :percentage
      t.timestamps null: false
    end
  end
end
