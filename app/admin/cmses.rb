# app/admin/cmses.rb
ActiveAdmin.register Cms do
  permit_params :page_name, :language, :location, :type, :value, :last_modified_date
end
