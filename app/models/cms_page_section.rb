# frozen_string_literal: true

# app/models/cms_page_section.rb
class CmsPageSection < ApplicationRecord
  belongs_to :cms_page, foreign_key: 'pageid'
  belongs_to :cms_section, foreign_key: 'sectionid'
  has_many :cms_values, foreign_key: 'pagesectionid'

  validates :cms_page, :cms_section, presence: true
  validates :cms_section_id, uniqueness: { scope: :cms_page_id, message: 'The combination of pageId and sectionId must be unique' }


  def self.ransackable_attributes(_auth_object = nil)
    %w[cms_page_id cms_section_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cms_page cms_section]
  end

  def display_name
    "#{cms_page.pagename} - #{cms_section.sectionname}" if cms_page && cms_section
  end
end
