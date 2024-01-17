# frozen_string_literal: true

# app/admin/cms_section_components.rb
ActiveAdmin.register CmsSectionComponent do
  permit_params :cms_section_id, :cms_component_id
end
