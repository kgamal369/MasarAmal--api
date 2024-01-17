# frozen_string_literal: true

# app/admin/cms_pages.rb
ActiveAdmin.register CmsPage do
  permit_params :page_name
  filter :page_name # only enable filtering by page_name
end
