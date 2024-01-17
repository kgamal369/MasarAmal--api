# frozen_string_literal: true

# app/admin/cms_languages.rb
ActiveAdmin.register CmsLanguage do
  permit_params :language_name

  index do
    selectable_column
    id_column
    column :language_name
    actions
  end

  filter :language_name
end
