# frozen_string_literal: true

# app/models/cms_section.rb
class CmsSection < ApplicationRecord
  has_many :page_sections, class_name: 'CmsPageSection', foreign_key: 'sectionid', dependent: :destroy
  has_many :section_components, class_name: 'CmsSectionComponent', foreign_key: 'sectionid', dependent: :destroy
  validates :section_name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id section_name]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[page_sections section_components]
  end
end
