# app/models/cms_value.rb
class CmsValue < ApplicationRecord
  belongs_to :cms_page_section, class_name: 'CmsPageSection', foreign_key: 'pagesectionid', optional: true
  belongs_to :cms_section_component, class_name: 'CmsSectionComponent', foreign_key: 'sectioncomponentid', optional: true
  belongs_to :cms_language, class_name: 'CmsLanguage', foreign_key: 'languageid', optional: true
  validates :value, presence: true
  validates :pagesectionid, uniqueness: { scope: [:sectioncomponentid, :languageid], message: 'Combination of page, section, component, and language must be unique' }
  has_one_attached :image

  def self.ransackable_attributes(_auth_object = nil)
    %w[id value pagesectionid sectioncomponentid languageid]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cms_page_section cms_section_component cms_language]
  end

  # Define a custom ransacker for languageid
  ransacker :languageid do
    Arel.sql('languageid')
  end

  def value=(new_value)
    if cms_section_component&.cms_component&.is_image_component?
      attach_image(new_value)
    else
      write_attribute(:value, new_value)
    end
  end

  private

  def attach_image(file)
    image.attach(file) if file.present?
  end

end
