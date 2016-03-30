class ChangeForeignKeyOfGoodAgain < ActiveRecord::Migration
  def change
    remove_reference :goods, :trader
    add_reference :goods, :product
  end
end
