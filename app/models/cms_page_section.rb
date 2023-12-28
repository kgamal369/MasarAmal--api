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
end
