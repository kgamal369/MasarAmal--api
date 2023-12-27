# app/admin/cms_components.rb
ActiveAdmin.register CmsComponent do
  permit_params :component_name, :component_type
end
