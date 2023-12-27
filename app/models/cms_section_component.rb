# app/models/cms_section_component.rb
class CmsSectionComponent < ApplicationRecord
  belongs_to :cms_section
  belongs_to :cms_component
  validates :cms_section, :cms_component, presence: true
end
