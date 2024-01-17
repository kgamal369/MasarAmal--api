# frozen_string_literal: true

ActiveAdmin.register Facility do
  permit_params :name, :text, :pictures, :last_modified
end
