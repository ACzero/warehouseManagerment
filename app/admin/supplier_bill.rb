ActiveAdmin.register SupplierBill do
  permit_params :name, :total_amount, :total_price,
                :good_id, :trader_id, :trader_type

  # remove new button on index page
  config.remove_action_item(:new)
  # remove new & edit button on other place
  actions :all, :except => [:new, :edit]

  filter :name
  filter :good
  filter :created_at

  menu priority: 6

  config.sort_order = "created_at_desc"

  action_item :add_import_bill, only: [:index] do
    link_to '添加进货单', new_admin_supplier_bill_path(trader_type: "Supplier")
  end
  #
  # action_item :add_sell_bill, only: [:index] do
  #   link_to '添加销售单', new_admin_bill_path(trader_type: "Buyer")
  # end

  index do
    column :name
    column :good
    column '总量' do |bill|
      bill.total_amount + (bill_statistics[bill.id].try(:[], :total_amount) || 0)
    end
    column '总额' do |bill|
      bill.total_price + (bill_statistics[bill.id].try(:[], :total_pay) || 0)
    end
    column '剩余量' do |bill|
      bill.total_amount
    end
    column '剩余金额' do |bill|
      bill.total_price
    end
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
      f.input :good, include_blank: false
      f.input :total_amount
      f.input :total_price
    end
    f.actions
  end

  controller do
    def scoped_collection
      SupplierBill.includes(:deliver_histories, :pay_histories)
    end

    def index
      super do |format|
        @bill_statistics = Bill.statistics(@supplier_bills.pluck(:id))
      end
    end

    def new
      @trader_type = params[:trader_type] == "Buyer" ? "Buyer" : "Supplier"
      @trader_collection = @trader_type.constantize.all
      super
    end
  end

  csv do
    bill_statistics = Bill.statistics(SupplierBill.all.pluck(:id))
    column :name
    column '商品' do |bill|
      bill.good.name
    end
    column '总量' do |bill|
      bill.total_amount + (bill_statistics[bill.id].try(:[], :total_amount) || 0)
    end
    column '总额' do |bill|
      bill.total_price + (bill_statistics[bill.id].try(:[], :total_pay) || 0)
    end
    column '剩余量' do |bill|
      bill.total_amount
    end
    column '剩余金额' do |bill|
      bill.total_price
    end
    column :created_at
  end
end
