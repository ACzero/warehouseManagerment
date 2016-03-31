ActiveAdmin.register PayHistory do
  permit_params :pay, :bill_id

  form do |f|
    f.inputs do
      f.input :bill, :collection => Bill.all.map { |b| [b.name, b.id] }, :selected => assigns[:bill_id], include_blank: false
      f.input :pay
    end
  end

  controller do
    def new
      @bill_id = params[:bill_id]
      super
    end
  end
end
