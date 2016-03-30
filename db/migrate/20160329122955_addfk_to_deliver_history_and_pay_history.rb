class AddfkToDeliverHistoryAndPayHistory < ActiveRecord::Migration
  def change
    add_reference :deliver_histories, :bill
    add_reference :pay_histories, :bill
  end
end
