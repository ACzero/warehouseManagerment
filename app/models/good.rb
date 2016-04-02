class Good < ActiveRecord::Base
  has_many :raw_materials, class_name: "Good", foreign_key: "product_id"
  belongs_to :product, class_name: "Good"

  enum good_type: [ :raw, :product ]

  before_create :check_good_type

  def self.good_amount_statistics(target_goods = nil)
    statistics = target_goods.nil? ? bills_amount_statistics : bills_amount_statistics.where(good_id: target_goods)

    statistics_arr = statistics.map do |good_sum|
      [good_sum.good_id, good_sum.total]
    end

    Hash[statistics_arr]
  end

  private
  def self.bills_amount_statistics
    Bill.joins('LEFT OUTER JOIN deliver_histories on bills.id = deliver_histories.bill_id')
      .group("bills.good_id").select("bills.good_id,
        SUM(CASE
              WHEN bills.trader_type = 'Supplier'
              THEN deliver_histories.amount
              ELSE -deliver_histories.amount
            END) AS total")
  end

  def check_good_type
    if self.raw?
      if self.product.nil?
        errors.add(:product, '原料商品必须选择成品')
        return false
      end
    elsif self.product?
      if self.product.present?
        errors.add(:product, '成品不能设置该项')
        return false
      end
    else
      errors.add(:good_type, '请设置商品类型')
      return false
    end
  end
end
