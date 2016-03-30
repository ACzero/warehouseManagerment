class ChangeForeignKeyOfGood < ActiveRecord::Migration
  def change
    remove_column :goods, :good_id
    add_reference :goods, :trader
  end
end
