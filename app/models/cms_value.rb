# app/models/cms_value.rb
class CmsValue < ApplicationRecord
  belongs_to :cms_page_section, foreign_key: 'pagesectionid'
  belongs_to :cms_section_component, foreign_key: 'sectioncomponentid'
  belongs_to :cms_language, foreign_key: 'languageid'
  validates :value, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id value cms_page_section_id cms_section_component_id cms_language_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[cms_page_section cms_section_component cms_language]
  end

  def self.filter_options
    [
      ['Home Page Hero Section Arabic', 'home_page_hero_arabic'],
      ['Home Page Hero Section English', 'home_page_hero_english'],
      # Add other options here...
    ]
  end
  
  ransacker :page_name do
    Arel.sql('(SELECT pagename FROM cms_pages WHERE cms_pages.pageid = cms_values.cms_page_section_id)')
  end

  scope :with_page_name, ->(page_name) {
    joins(cms_page_section: :cms_page).where(cms_pages: { pagename: page_name })
  }
end
