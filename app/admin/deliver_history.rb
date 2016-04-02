ActiveAdmin.register DeliverHistory do
  permit_params :amount, :bill_id

  # remove from menu
  menu false
  # remove filter
  config.filters = false
  # remove new button on index page
  config.remove_action_item(:new)
  # remove new & edit button on other place
  actions :all, :except => [:new, :edit]

  form do |f|
    f.inputs do
      f.input :bill, :collection => Bill.all.map { |b| [b.name, b.id] }, :selected => assigns[:bill_id], include_blank: false
      f.input :amount
    end
    f.actions do
      f.action :submit
      f.cancel_link admin_bills_path
    end
  end

  controller do
    def new
      @bill_id = params[:bill_id]
      super
    end
  end

end
