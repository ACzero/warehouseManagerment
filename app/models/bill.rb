class Bill < ActiveRecord::Base
  has_many :deliver_histories, dependent: :destroy
  has_many :pay_histories, dependent: :destroy
  belongs_to :trader, polymorphic: true
  belongs_to :good
end
