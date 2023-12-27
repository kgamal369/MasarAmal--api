# app/models/cms_page_section.rb
class CmsPageSection < ApplicationRecord
  belongs_to :cms_page
  belongs_to :cms_section
  validates :cms_page, :cms_section, presence: true
end
