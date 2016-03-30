class ChangeStoreTypeOfGood < ActiveRecord::Migration
  def change
    remove_column :goods, :store
    add_column :goods, :store, :float
  end
end
