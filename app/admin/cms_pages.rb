# frozen_string_literal: true

# app/admin/cms_pages.rb
ActiveAdmin.register CmsPage do
  permit_params :pagename

  # Index page
  index do
    selectable_column
    id_column
    column :pagename, label: 'Page Name'
    actions
  end

  # Filters
  filter :pagename, label: 'Page Name'

  # Edit page
  form do |f|
    f.inputs 'Cms Page Details' do
      f.input :pagename, label: 'Page Name'
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :pagename, label: 'Page Name'
    end
  end
end
