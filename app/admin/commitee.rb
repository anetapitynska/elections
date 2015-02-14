ActiveAdmin.register Commitee do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, 
              voivodeship_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  show do
   attributes_table do
      row :name
      row :created_at
      row :updated_at
      row :voivodeship_ids

 
      end
  end

  form do |f|

    f.inputs do
      f.input :name
      f.input :voivodeships, :as => :check_boxes
    end
    f.actions
  end

end
