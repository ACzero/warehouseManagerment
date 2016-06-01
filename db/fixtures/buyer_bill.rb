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

(1..5).each_with_index do |month, idx|
  num = 100 * (idx + 1)
  (1..28).each_with_index do |day, index|
    id = index + num
    amount = 3 + (3 * rand).round(0)
    total_price = amount * 5

    ga << {
      id: id,
      good_id: 1,
      trader_id: 1,
      trader_type: "Buyer",
      total_amount: amount,
      total_price: total_price,
      created_at: Time.parse("2016-0#{month}-#{day}")
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
end

(1..5).each_with_index do |month, idx|
  num = 100 * (idx + 6)
  (1..28).each_with_index do |day, index|
    id = index + num
    amount = 3 + (3 * rand).round(0)
    total_price = amount * 8

    gb << {
      id: id,
      good_id: 2,
      trader_id: 1,
      trader_type: "Buyer",
      total_amount: amount,
      total_price: total_price,
      created_at: Time.parse("2016-0#{month}-#{day}")
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
end

(1..5).each_with_index do |month, idx|
  num = 100 * (idx + 11)
  (1..28).each_with_index do |day, index|
    id = index + num
    amount = 3 + (3 * rand).round(0)
    total_price = amount * 10

    gc << {
      id: id,
      good_id: 3,
      trader_id: 2,
      trader_type: "Buyer",
      total_amount: amount,
      total_price: total_price,
      created_at: Time.parse("2016-0#{month}-#{day}")
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
end

(1..5).each_with_index do |month, idx|
  num = 100 * (idx + 16)
  (1..28).each_with_index do |day, index|
    id = index + num
    amount = 3 + (3 * rand).round(0)
    total_price = amount * 6

    gd << {
      id: id,
      good_id: 4,
      trader_id: 2,
      trader_type: "Buyer",
      total_amount: amount,
      total_price: total_price,
      created_at: Time.parse("2016-0#{month}-#{day}")
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
end

(1..5).each_with_index do |month, idx|
  num = 100 * (idx + 21)
  (1..28).each_with_index do |day, index|
    id = index + num
    amount = 3 + (3 * rand).round(0)
    total_price = amount * 2

    ge << {
      id: id,
      good_id: 5,
      trader_id: 3,
      trader_type: "Buyer",
      total_amount: amount,
      total_price: total_price,
      created_at: Time.parse("2016-0#{month}-#{day}")
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
end

BuyerBill.seed(:id,
  *ga, *gb, *gc, *gd, *ge
)

DeliverHistory.seed(:id,
  *da,*db,*dc,*dd,*de
)

PayHistory.seed(:id,
  *pa,*pb,*pc,*pd,*pe
)
