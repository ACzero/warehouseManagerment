ActiveAdmin.register Good do
  permit_params :name, :good_type, :origin, :store, :percentage, :product_id

  filter :name
  filter :origin

  menu priority: 3

  index do
    column :name
    column :origin
    column :store
    column :total do |good|
      (assigns[:goods_statistics][good.id] || 0) + good.store
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :origin
      f.input :store
    end
    f.actions
  end

  controller do
    def index
      super do |format|
        @goods_statistics = Good.good_amount_statistics(@goods.pluck(:id))
      end
    end
  end
end
