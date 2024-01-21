# frozen_string_literal: true

# app/admin/cms_sections.rb
ActiveAdmin.register CmsSection do
  permit_params :sectionname

  # Index page
  index do
    selectable_column
    id_column
    column :sectionname, label: 'Section Name'
    actions
  end

  # Filters
  filter :sectionname, label: 'Section Name'

  # Edit page
  form do |f|
    f.inputs 'Cms Section Details' do
      f.input :sectionname, label: 'Section Name'
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :sectionname, label: 'Section Name'
    end
  end
end
