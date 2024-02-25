# app/models/cms_value.rb
class CmsValue < ApplicationRecord
    belongs_to :cms_page_section, foreign_key: 'pagesectionid'
    belongs_to :cms_section_component, foreign_key: 'sectioncomponentid'
    belongs_to :cms_language, foreign_key: 'languageid'
  
    validates :pagesectionid, presence: true
    validates :sectioncomponentid, presence: true
    validates :languageid, presence: true
    validates :value, presence: true
  
    validates :pagesectionid, uniqueness: { scope: %i[sectioncomponentid languageid] }
          
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
  
    # # Method to handle the creation or finding of the page section
    # def self.create_with_page_and_section(page_id, section_id, component_id, language_id, value)
    #   page_section = CmsPageSection.find_or_create_by(pageid: page_id, sectionid: section_id)
    #   create(pagesectionid: page_section.id, sectioncomponentid: component_id, languageid: language_id, value:)
    # end
  end
  
