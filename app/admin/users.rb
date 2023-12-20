ActiveAdmin.register User do
  permit_params :username ,:password ,:email ,:full_name ,:registration_date ,:last_login
end
