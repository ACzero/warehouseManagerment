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
      f.input :bill_id, as: :hidden, input_html: { value: assigns[:bill_id] }
      f.input :amount
    end
    f.actions do
      f.action :submit
      f.cancel_link :back
    end
  end

  controller do
    def new
      @bill_id = params[:bill_id]
      super
    end
  end

end
