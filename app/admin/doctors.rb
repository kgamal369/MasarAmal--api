# frozen_string_literal: true

# app/admin/doctors.rb
ActiveAdmin.register Doctor do
  permit_params :name, :text, :pictures, :last_modified
end
