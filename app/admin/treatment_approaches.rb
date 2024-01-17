# frozen_string_literal: true

ActiveAdmin.register TreatmentApproach do
  permit_params :name, :text, :last_modified
end
