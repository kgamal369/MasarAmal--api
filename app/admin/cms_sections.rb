# frozen_string_literal: true

# app/admin/cms_sections.rb
ActiveAdmin.register CmsSection do
  permit_params :section_name

  # Index page
  index do
    selectable_column
    id_column
    column :section_name, label: 'Section Name'
    actions
  end

  # Filters
  filter :section_name, label: 'Section Name'

  # Edit page
  form do |f|
    f.inputs 'Cms Section Details' do
      f.input :section_name, label: 'Section Name'
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :section_name, label: 'Section Name'
    end
  end
end
