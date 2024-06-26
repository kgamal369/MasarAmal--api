# frozen_string_literal: true

# app/models/cms_page_section.rb
class CmsPageSection < ApplicationRecord
  belongs_to :cms_page, foreign_key: 'pageid'
  belongs_to :cms_section, foreign_key: 'sectionid'
  has_many :cms_values, foreign_key: 'pagesectionid'

  validates :cms_page, :cms_section, presence: true
  validates :sectionid, uniqueness: { scope: :pageid, message: 'The combination of pageid and sectionid must be unique' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[pageid sectionid]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cms_page cms_section]
  end

  def display_name
    "#{cms_page.pagename} - #{cms_section.sectionname}" if cms_page && cms_section
  end
end
