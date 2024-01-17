# frozen_string_literal: true

ActiveAdmin.register UserRole do
  permit_params :user_id, :role_id
end
