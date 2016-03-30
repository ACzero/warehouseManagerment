class ChangeTypeOfGood < ActiveRecord::Migration
  def change
    rename_column :goods, :type, :good_type
  end
end
