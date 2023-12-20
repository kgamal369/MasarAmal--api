ActiveAdmin.register Facility do
  permit_params :name, :text, :pictures, :last_modified
end
