ActiveAdmin.register Commitee do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, voivodeship_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :voivodeships, :as => :check_boxes
    end
    f.actions
  end

end
