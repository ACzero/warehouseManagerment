class Buyer < ActiveRecord::Base
  has_many :bills, as: :trader
end
