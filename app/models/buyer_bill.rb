class BuyerBill < Bill
  def create_buy_and_deliver
    self.pay_histories.create(pay: self.total_price)
    self.deliver_histories.create(amount: self.total_amount)
  end
end
