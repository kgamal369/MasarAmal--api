# frozen_string_literal: true

# app/models/cms_component.rb
class CmsComponent < ApplicationRecord
  has_many :section_components, class_name: 'CmsSectionComponent', foreign_key: 'componentid', dependent: :destroy
  validates :componentname, :componenttype, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id componentname componenttype]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['section_components']
  end

  def is_image_component?
    componenttype == 'Image'
  end
end
