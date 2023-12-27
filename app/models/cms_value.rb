# app/models/cms_value.rb
class CmsValue < ApplicationRecord
  belongs_to :cms_page_section
  belongs_to :cms_section_component
  belongs_to :cms_language
  validates :value, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id value]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[cms_page_section cms_section_component cms_language]
  end
end
