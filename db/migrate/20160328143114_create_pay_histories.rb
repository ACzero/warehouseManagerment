class CreatePayHistories < ActiveRecord::Migration
  def change
    create_table :pay_histories do |t|
      t.float :pay
      t.timestamps null: false
    end
  end
end
