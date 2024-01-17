# frozen_string_literal: true

# app/admin/cms_page_sections.rb
ActiveAdmin.register CmsPageSection do
  permit_params :cms_page_id, :cms_section_id
end
