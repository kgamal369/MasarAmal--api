# frozen_string_literal: true

# app/models/cms_value.rb
class CmsValue < ApplicationRecord
  belongs_to :cms_page_section, class_name: 'CmsPageSection', foreign_key: 'pagesectionid', optional: true
  belongs_to :cms_section_component, class_name: 'CmsSectionComponent', foreign_key: 'sectioncomponentid',
                                     optional: true
  belongs_to :cms_language, class_name: 'CmsLanguage', foreign_key: 'languageid', optional: true

 # Validations for mandatory attributes
 validates :pagesectionid, presence: { message: 'Page section ID is required' }
 validates :sectioncomponentid, presence: { message: 'Section component ID is required' }
 validates :languageid, presence: { message: 'Language ID is required' }
 validates :value, presence: { message: 'Value is required' }

  # Unique constraint validation
 validates :pagesectionid,
            uniqueness: { scope: %i[sectioncomponentid languageid],
                          message: 'Combination of page, section, component, and language must be unique' }

              
  has_one_attached :image

  validate :image_type, if: -> { image.attached? }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id value pagesectionid sectioncomponentid languageid]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cms_page_section cms_section_component cms_language]
  end

  ransacker :languageid do
    Arel.sql('languageid')
  end

  # Virtual attributes for form
  attr_accessor :page_id, :section_id, :component_id

  private

  def image_type
    return unless image.attached? && !image.content_type.in?(%w[image/jpeg image/png])

    errors.add(:image, 'must be a JPEG or PNG')
  end

  # Method to handle the creation or finding of the page section
  def self.create_with_page_and_section(page_id, section_id, component_id, language_id, value)
    page_section = CmsPageSection.find_or_create_by(cms_page_id: page_id, cms_section_id: section_id)
    create(pagesectionid: page_section.id, sectioncomponentid: component_id, languageid: language_id, value:)
  end
end
