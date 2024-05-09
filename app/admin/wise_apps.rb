ActiveAdmin.register WiseApp do
  menu priority: 1, label: "Wise Apps", parent: "Applications", icon: "fa fa-star"
  permit_params :icon, :app_name, :discription, :app_type, :numbers_of_app
  index do
    selectable_column
    id_column
    column "Icon" do |app|
      if app.icon.present?
        image_tag app.icon, size: "50x50"  # Adjust size as needed
      else
        "No icon"
      end
    end
    column :app_name
    column :description
    column :app_type do |app|
      app.app_type
    end
    column :numbers_of_app
    actions
  end

  filter :app_type, as: :select, collection: WiseApp.app_types.keys.map { |k| [k.humanize, k] }

  form do |f|
    f.inputs do
      f.input :icon, as: :file
      f.input :app_name
      f.input :description
      f.input :app_type, as: :select, collection: WiseApp.app_types.keys
      f.input :numbers_of_app
    end
    f.actions
  end
    
  show do
    attributes_table do
      row :icon do |app|
        if app.icon.present?
          image_tag app.icon
        else
          "No icon available"
        end
      end
      row :app_name
      row :description
      row :app_type do |app|
        app.app_type
      end
      row :numbers_of_app

    end
  end
end
