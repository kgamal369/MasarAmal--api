# frozen_string_literal: true

ActiveAdmin.register MentalService do
  permit_params :name, :text, :last_modified
end
