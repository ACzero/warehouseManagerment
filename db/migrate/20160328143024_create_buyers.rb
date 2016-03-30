class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :contact
      t.string :phone_number
      t.string :address
      t.string :bank_account_number
      t.string :bank_account_name
      t.timestamps null: false
    end
  end
end
