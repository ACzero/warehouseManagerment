ActiveAdmin.register Bill do
  permit_params :name, :total_amount, :total_price,
                :good_id, :trader_id, :trader_type

  # remove new button on index page
  config.remove_action_item(:new)
  # remove new & edit button on other place
  actions :all, :except => [:new, :edit]

  action_item :add_import_bill, only: [:index] do
    link_to '添加进货单', new_admin_bill_path(trader_type: "Supplier")
  end

  action_item :add_sell_bill, only: [:index] do
    link_to '添加销售单', new_admin_bill_path(trader_type: "Buyer")
  end

  index do
    column :name
    column :total_amount
    column :total_price
    column :trader_type
    column :created_at
    actions defaults: true
    actions defaults: false do |bill|
      if bill.deliver_histories.present?
        link_to '查看送货记录', admin_deliver_histories_path(q: { bill_id_eq: bill.id })
      end
    end
    actions defaults: false do |bill|
      if bill.pay_histories.present?
        link_to '查看付费记录', admin_pay_histories_path(q: { bill_id_eq: bill.id })
      end
    end
    actions defaults: false do |bill|
      link_to '添加送货记录', new_admin_deliver_history_path(bill_id: bill.id)
    end
    actions defaults: false do |bill|
      link_to '添加付费记录', new_admin_pay_history_path(bill_id: bill.id)
    end
  end

  form do |f|
    inputs do
      f.input :name
      f.input :trader_type, :as => :hidden, :input_html => { value: assigns[:trader_type] }
      f.input :trader, collection: assigns[:trader_collection], :include_blank => false
      f.input :good
      f.input :total_amount
      f.input :total_price
    end
    f.actions
  end

  controller do
    def scoped_collection
      Bill.includes(:deliver_histories, :pay_histories)
    end

    def new
      @trader_type = params[:trader_type] == "Buyer" ? "Buyer" : "Supplier"
      @trader_collection = @trader_type.constantize.all
      super
    end
  end
end
