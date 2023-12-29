# app/models/cms_section_component.rb
class CmsSectionComponent < ApplicationRecord
  belongs_to :cms_section
  belongs_to :cms_component
  validates :cms_section, :cms_component, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id]
  end

  def self.ransackable_associations(auth_object = nil)
    ['cms_section', 'cms_component']
  end

  
  def display_name
    if cms_section.present? && cms_component.present?
      "Section: #{cms_section.section_name}, Component: #{cms_component.component_name}"
    else
      "Section or Component missing"
    end
  end

end
