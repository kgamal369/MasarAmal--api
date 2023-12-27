# app/admin/cms_pages.rb
ActiveAdmin.register CmsPage do
  permit_params :page_name
end
