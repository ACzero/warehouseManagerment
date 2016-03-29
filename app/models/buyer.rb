class Buyer < ActiveRecord::Base
  has_many :bill, as: :trader
end
