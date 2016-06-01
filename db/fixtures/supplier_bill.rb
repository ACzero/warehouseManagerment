ga = []
gb = []
gc = []
gd = []
ge = []

da = []
db = []
dc = []
dd = []
de = []

pa = []
pb = []
pc = []
pd = []
pe = []

(1..5).each_with_index do |month, index|
  id = index + 1
  amount = 30 + (50 * rand).round(0)
  total_price = amount * 3

  ga << {
    id: id,
    good_id: 1,
    trader_id: 1,
    trader_type: "Supplier",
    total_amount: amount,
    total_price: total_price,
    created_at: Time.parse("2016-0#{month}-15")
  }

  da << {
    bill_id: id,
    amount: amount
  }

  pa << {
    bill_id: id,
    pay: total_price
  }
end

(1..5).each_with_index do |month, index|
  id = index + 6
  amount = 30 + (50 * rand).round(0)
  total_price = amount * 5

  gb << {
    id: id,
    good_id: 2,
    trader_id: 1,
    trader_type: "Supplier",
    total_amount: amount,
    total_price: total_price,
    created_at: Time.parse("2016-0#{month}-15")
  }

  db << {
    bill_id: id,
    amount: amount
  }

  pb << {
    bill_id: id,
    pay: total_price
  }
end

(1..5).each_with_index do |month, index|
  id = index + 11
  amount = 30 + (50 * rand).round(0)
  total_price = amount * 6

  gc << {
    id: id,
    good_id: 3,
    trader_id: 2,
    trader_type: "Supplier",
    total_amount: amount,
    total_price: total_price,
    created_at: Time.parse("2016-0#{month}-15")
  }

  dc << {
    bill_id: id,
    amount: amount
  }

  pc << {
    bill_id: id,
    pay: total_price
  }
end

(1..5).each_with_index do |month, index|
  id = index + 16
  amount = 30 + (50 * rand).round(0)
  total_price = amount * 3

  gd << {
    id: id,
    good_id: 4,
    trader_id: 2,
    trader_type: "Supplier",
    total_amount: amount,
    total_price: total_price,
    created_at: Time.parse("2016-0#{month}-15")
  }

  dd << {
    bill_id: id,
    amount: amount
  }

  pd << {
    bill_id: id,
    pay: total_price
  }
end

(1..5).each_with_index do |month, index|
  id = index + 21
  amount = 30 + (50 * rand).round(0)
  total_price = amount * 1

  ge << {
    id: id,
    good_id: 5,
    trader_id: 3,
    trader_type: "Supplier",
    total_amount: amount,
    total_price: total_price,
    created_at: Time.parse("2016-0#{month}-15")
  }

  de << {
    bill_id: id,
    amount: amount
  }

  pe << {
    bill_id: id,
    pay: total_price
  }
end






SupplierBill.seed(:id,
  *ga, *gb, *gc, *gd, *ge
)

DeliverHistory.seed(:id,
  *da,*db,*dc,*dd,*de
)

PayHistory.seed(:id,
  *pa,*pb,*pc,*pd,*pe
)
