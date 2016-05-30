ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: "商品销量统计" do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    panel "销售总量统计" do
      table_for BuyerBill.sell_amount_statiscian do
        column "商品" do |bill|
          bill[:good].name
        end

        (7.day.ago.to_date..Time.now.to_date).reverse_each do |date|
          column date.to_s do |bill|
            statiscian = bill[:statiscian][date.to_s]
            statiscian ? statiscian.first.sum_amount : 0.0
          end
        end
      end
    end

    panel "销售总额统计" do
      table_for BuyerBill.sell_price_statiscian do
        column "商品" do |bill|
          bill[:good].name
        end

        (7.day.ago.to_date..Time.now.to_date).reverse_each do |date|
          column date.to_s do |bill|
            statiscian = bill[:statiscian][date.to_s]
            statiscian ? statiscian.first.sum_price : 0.0
          end
        end
      end
    end

    panel "销售总量月统计" do
      table_for BuyerBill.month_amount_statiscian do
        column "商品" do |bill|
          bill[:good].name
        end

        (1..12).each do |month|
          column "#{month}月" do |bill|
            statiscian = bill[:statiscian][month]
            statiscian ? statiscian.first.sum_amount : 0.0
          end
        end
      end
    end

    panel "销售总额月统计" do
      table_for BuyerBill.month_price_statiscian do
        column "商品" do |bill|
          bill[:good].name
        end

        (1..12).each do |month|
          column "#{month}月" do |bill|
            statiscian = bill[:statiscian][month]
            statiscian ? statiscian.first.sum_price : 0.0
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

  end
end
