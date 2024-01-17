# frozen_string_literal: true

ActiveAdmin.register Role do
  permit_params :role_name
end
