# app/models/cms_page_section.rb
class CmsPageSection < ApplicationRecord
  belongs_to :cms_page, foreign_key: 'pageid'
  belongs_to :cms_section, foreign_key: 'sectionid'
  validates :cms_page, :cms_section, presence: true
    
  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[cms_page_id cms_section_id]
  end

  def self.ransackable_associations(auth_object = nil)
    ['cms_page', 'cms_section']
  end

  def display_name
    "#{cms_page.page_name} - #{cms_section.section_name}" if cms_page && cms_section
  end

end
