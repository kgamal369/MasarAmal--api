ActiveAdmin.register BlogPost do
  permit_params :header, :text, :last_modified
end
