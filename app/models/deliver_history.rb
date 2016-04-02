class DeliverHistory < ActiveRecord::Base
  belongs_to :bill

  before_create :change_bill_amount
  after_destroy :rollback_bill_amount

  private
  def change_bill_amount
    bill = Bill.find_by_id(self.bill_id)
    if bill
      bill.with_lock do
        bill.total_amount -= self.amount
        if bill.total_amount < 0
          puts errors
          puts 'error'
          errors.add(:amount, "amount over total_amount")
          return false
        end
        bill.save!
      end
    else
      errors.add(:bill, "not select a bill")
      return false
    end
  end

  def rollback_bill_amount
    bill = Bill.find_by_id(self.bill_id)
    if bill
      bill.total_amount += self.amount
      bill.save
    end
  end
end
