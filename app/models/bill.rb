class Bill < ActiveRecord::Base
  has_many :deliver_histories
  has_many :pay_histories
  belongs_to :trader, polymorphic: true
  belongs_to :good
end
