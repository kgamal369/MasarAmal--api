# frozen_string_literal: true
# app/admin/cms_section_components.rb
ActiveAdmin.register CmsSectionComponent do
  permit_params :cms_section_id, :cms_component_id

  index do
    selectable_column
    id_column
    column 'Section Name' do |section_component|
      section_component.cms_section.sectionname
    end
    column 'Component Name' do |section_component|
      section_component.cms_component.componentname
    end
    actions
  end

  # Update filters to match the actual attribute names in the models
  filter :cms_section_sectionname, as: :string, label: 'Section Name'
  filter :cms_component_componentname, as: :string, label: 'Component Name'

  form do |f|
    f.inputs 'Cms Section Component Details' do
      f.input :cms_section_id, as: :select, collection: CmsSection.all.map { |s| [s.sectionname, s.id] }
      f.input :cms_component_id, as: :select, collection: CmsComponent.all.map { |c| [c.componentname, c.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :sectionname do |component|
        component.cms_section.sectionname if component.cms_section
      end
      row :componentname do |component|
        component.cms_component.componentname if component.cms_component
      end
    end
  end
end

