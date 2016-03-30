ActiveAdmin.register Bill do
  permit_params :total_amount, :total_price, :good_id, :trader_id, :trader_type

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
