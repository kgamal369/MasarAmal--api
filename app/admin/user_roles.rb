ActiveAdmin.register UserRole do
  permit_params :user_id, :role_id
end
