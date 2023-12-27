# app/admin/cms_values.rb
ActiveAdmin.register CmsValue do
  permit_params :value, :cms_page_section_id, :cms_section_component_id, :cms_language_id
end
