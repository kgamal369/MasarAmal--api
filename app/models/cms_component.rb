# app/models/cms_component.rb
class CmsComponent < ApplicationRecord
  has_many :section_components, dependent: :destroy
  validates :component_name, :component_type, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id component_name component_type]
  end
end
