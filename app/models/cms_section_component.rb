# app/models/cms_section_component.rb
class CmsSectionComponent < ApplicationRecord
  belongs_to :cms_section, foreign_key: 'sectionid'
  belongs_to :cms_component, foreign_key: 'componentid'
  validates :cms_section, :cms_component, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id]
  end

  def self.ransackable_associations(auth_object = nil)
    ['cms_section', 'cms_component']
  end

  def display_name
    "#{cms_section.sectionname} - #{cms_component.componentname}" if cms_section && cms_component
  end

end
