ActiveAdmin.register Bill do
  permit_params :total_amount, :total_price, :good_id, :trader_id, :trader_type

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

  form do |f|
    inputs do
      f.input :trader_type, :as => :hidden, :input_html => { value: assigns[:trader_type] }
      f.input :trader, collection: assigns[:trader_collection], :include_blank => false
      f.input :good
      f.input :total_amount
      f.input :total_price
    end
    f.actions
  end

  controller do
    def new
      @trader_type = params[:trader_type] == "Buyer" ? "Buyer" : "Supplier"
      @trader_collection = @trader_type.constantize.all
      super
    end
  end
end
