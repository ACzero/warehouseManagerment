ActiveAdmin.register DeliverHistory do
  permit_params :amount, :bill_id

  form do |f|
    f.inputs do
      f.input :bill, :collection => Bill.all.map { |b| [b.name, b.id] }, :selected => assigns[:bill_id], include_blank: false
      f.input :amount
    end
  end

  controller do
    def new
      @bill_id = params[:bill_id]
      super
    end
  end

end
