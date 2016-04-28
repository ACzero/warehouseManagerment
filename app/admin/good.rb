ActiveAdmin.register Good do
  permit_params :name, :good_type, :origin, :store, :percentage, :product_id

  index do
    column :name
    column :good_type
    column :origin
    column :store
    column :total do |good|
      (assigns[:goods_statistics][good.id] || 0) + good.store
    end
    column :product
    column :percentage
    actions
  end

  form do |f|
    f.inputs do
      f.input :name, as: :um_editor
      f.input :good_type, :include_blank => false,
        :collection => [['成品', 'product'], ['原材料', 'raw']]
      f.input :origin
      f.input :store
      f.input :product
      f.input :percentage
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
