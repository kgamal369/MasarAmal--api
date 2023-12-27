# app/models/cms_section.rb
class CmsSection < ApplicationRecord
  has_many :page_sections, dependent: :destroy
  has_many :section_components, dependent: :destroy
  validates :section_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id section_name]
  end
end
