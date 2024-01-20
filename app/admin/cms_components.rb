# frozen_string_literal: true

# app/admin/cms_components.rb
ActiveAdmin.register CmsComponent do
  permit_params :component_name, :component_type

  # Index page
  index do
    selectable_column
    id_column
    column :component_name
    column :component_type
    actions
  end

  # Filters
  filter :component_name
  filter :component_type

  # Edit page
  form do |f|
    f.inputs 'Cms Component Details' do
      f.input :component_name
      f.input :component_type
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :component_name
      row :component_type
    end
  end
end
