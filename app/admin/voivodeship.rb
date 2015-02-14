ActiveAdmin.register Voivodeship do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :seats
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
      row :seats
      row :created_at
      row :updated_at
      row :commitee_ids 

      end
  end

  form do |f|
    f.actions
    f.inputs 'coś' do

      f.input :name
      f.input :seats
      f.input :commitees, :as => :check_boxes
    end
    f.actions


  end


end
