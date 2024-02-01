# frozen_string_literal: true

# app/models/cms_section_component.rb
class CmsSectionComponent < ApplicationRecord
  belongs_to :cms_section, foreign_key: 'sectionid'
  belongs_to :cms_component, foreign_key: 'componentid'
  has_many :cms_values, foreign_key: 'sectioncomponentid'

  validates :cms_section, :cms_component, presence: true
  validates :componentid, uniqueness: { scope: :sectionid, message: 'The combination of sectionId and componentId must be unique' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id sectionid componentid]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cms_section cms_component]
  end

  def display_name
    "#{cms_section.sectionname} - #{cms_component.componentname}" if cms_section && cms_component
  end
end
