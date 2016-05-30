class Bill < ActiveRecord::Base
  has_many :deliver_histories, dependent: :destroy
  has_many :pay_histories, dependent: :destroy
  belongs_to :trader, polymorphic: true
  belongs_to :good

  validates :total_amount, :total_price, :good, :trader, presence: true

  def self.statistics(target_bills = nil)
    statistics = target_bills ? all_statistics.where(id: target_bills) : all_statistics
    statistics_arr = statistics.map do |bill|
      [bill.id, { total_amount: bill.total_amount || 0, total_pay: bill.total_pay || 0}]
    end

    Hash[statistics_arr]
  end

  private
  def self.all_statistics
    Bill.joins('LEFT OUTER JOIN deliver_histories on bills.id = deliver_histories.bill_id')
      .joins('LEFT OUTER JOIN pay_histories on bills.id = pay_histories.bill_id')
      .group("bills.id").select("bills.id,
        SUM(deliver_histories.amount) AS total_amount,
        SUM(pay_histories.pay) AS total_pay")
  end
end
