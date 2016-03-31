class PayHistory < ActiveRecord::Base
  belongs_to :bill

  before_create :change_bill_pay
  after_destroy :rollback_bill_pay

  private
  def change_bill_pay
    bill = Bill.find_by_id(self.bill_id)
    if bill
      bill.with_lock do
        bill.total_price -= self.pay
        if bill.total_price < 0
          errors.add(:pay, "pay over total_price")
          return false
        end
        bill.save!
      end
    else
      errors.add(:bill, "not select a bill")
      return false
    end
  end

  def rollback_bill_pay
    bill = Bill.find_by_id(self.bill_id)
    if bill
      bill.total_price += self.pay
      bill.save
    end
  end
end
