# frozen_string_literal: true

# app/admin/cms_page_sections.rb
ActiveAdmin.register CmsPageSection do
  permit_params :cms_page_id, :cms_section_id

  index do
    selectable_column
    id_column
    column 'Page Name' do |page_section|
      page_section.cms_page.pagename if page_section.cms_page
    end
    column 'Section Name' do |page_section|
      page_section.cms_section.sectionname if page_section.cms_section
    end
    actions
  end

  # filter :cms_page_pagename, as: :string, label: 'Page Name'
  # filter :cms_section_sectionname, as: :string, label: 'Section Name'

  form do |f|
    f.inputs 'Cms Page Section Details' do
      f.input :cms_page_id, as: :select, collection: CmsPage.all.map { |p| [p.pagename, p.id] }
      f.input :cms_section_id, as: :select, collection: CmsSection.all.map { |s| [s.sectionname, s.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row 'Page Name' do |section|
        section.cms_page.pagename if section.cms_page
      end
      row 'Section Name' do |section|
        section.cms_section.sectionname if section.cms_section
      end
    end
  end
end