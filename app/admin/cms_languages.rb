# frozen_string_literal: true

# app/admin/cms_languages.rb
ActiveAdmin.register CmsLanguage do
  permit_params :language_name

  # Index page
  index do
    selectable_column
    id_column
    column :language_name
    actions
  end

  # Filters
  filter :language_name

  # Edit page
  form do |f|
    f.inputs 'Cms Language Details' do
      f.input :language_name
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :language_name
    end
  end
end
