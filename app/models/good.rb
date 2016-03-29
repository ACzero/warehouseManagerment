class Good < ActiveRecord::Base
  has_many :raw_materials, class_name: "Good", foreign_key: "product_id"
  belongs_to :product, class_name: "Good"
end
