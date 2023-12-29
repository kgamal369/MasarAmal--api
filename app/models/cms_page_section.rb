# app/models/cms_page_section.rb
class CmsPageSection < ApplicationRecord
  belongs_to :cms_page
  belongs_to :cms_section
  validates :cms_page, :cms_section, presence: true
    
  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    # Assuming 'cms_page_id' and 'cms_section_id' are the foreign keys.
    # Add any other attributes you want to be searchable.
    %w[cms_page_id cms_section_id]
  end

  def self.ransackable_associations(auth_object = nil)
    # List only the associations you want to be searchable
    ['cms_page', 'cms_section']
  end

  def display_name
    if cms_page.present? && cms_section.present?
      "#{cms_page.page_name} - #{cms_section.section_name}"
    else
      "Page or Section missing"
    end
  end

end
