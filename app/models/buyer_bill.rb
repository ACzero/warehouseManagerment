class BuyerBill < Bill
  def self.sell_amount_statiscian
    result = BuyerBill.includes(:good).group("good_id, DATE(bills.created_at)")
     .joins("LEFT OUTER join deliver_histories on deliver_histories.bill_id = bills.id")
     .select("
       bills.good_id,
       DATE(bills.created_at) AS date,
       SUM(deliver_histories.amount) AS sum_amount
     ").group_by(&:good)

    result.map do |k, v|
      {
        good: k,
        statiscian: v.group_by { |sum| sum.date.to_s }
      }
    end
  end

  def self.sell_price_statiscian
    result = BuyerBill.includes(:good).group("good_id, DATE(bills.created_at)")
     .joins("LEFT OUTER join pay_histories on pay_histories.bill_id = bills.id")
     .select("
       bills.good_id,
       DATE(bills.created_at) AS date,
       SUM(pay_histories.pay) AS sum_price
     ").group_by(&:good)

    result.map do |k, v|
      {
        good: k,
        statiscian: v.group_by { |sum| sum.date.to_s }
      }
    end
  end

  def self.month_amount_statiscian
    result = BuyerBill.includes(:good).group("good_id, EXTRACT(MONTH FROM bills.created_at)")
     .joins("LEFT OUTER join deliver_histories on deliver_histories.bill_id = bills.id")
     .select("
       bills.good_id,
       EXTRACT(MONTH FROM bills.created_at) AS month,
       SUM(deliver_histories.amount) AS sum_amount
     ").group_by(&:good)

    result.map do |k, v|
      {
        good: k,
        statiscian: v.group_by { |sum| sum.month.to_i }
      }
    end
  end

  def self.month_price_statiscian
    result = BuyerBill.includes(:good).group("good_id, EXTRACT(MONTH FROM bills.created_at)")
     .joins("LEFT OUTER join pay_histories on pay_histories.bill_id = bills.id")
     .select("
       bills.good_id,
       EXTRACT(MONTH FROM bills.created_at) AS month,
       SUM(pay_histories.pay) AS sum_price
     ").group_by(&:good)

    result.map do |k, v|
      {
        good: k,
        statiscian: v.group_by { |sum| sum.month.to_i }
      }
    end
  end

  def create_buy_and_deliver
    self.pay_histories.create(pay: self.total_price)
    self.deliver_histories.create(amount: self.total_amount)
  end
end
