class AddTypeToBill < ActiveRecord::Migration
  def change
    add_column :bills, :type, :string
  end
end
