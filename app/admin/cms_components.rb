# frozen_string_literal: true

# app/admin/cms_components.rb
ActiveAdmin.register CmsComponent do
  permit_params :componentname, :componenttype

  # Index page
  index do
    selectable_column
    id_column
    column :componentname
    column :componenttype
    actions
  end

  # Filters
  filter :componentname
  filter :componenttype

  # Edit page
  form do |f|
    f.inputs 'Cms Component Details' do
      f.input :componentname, label: 'Component Name'
      f.input :componenttype , label: 'Component Type'
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :componentname
      row :componenttype
    end
  end
end
