# app/admin/cms_sections.rb
ActiveAdmin.register CmsSection do
  permit_params :section_name
end
