# app/models/cms_page.rb
class CmsPage < ApplicationRecord
  has_many :page_sections, dependent: :destroy
  validates :page_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id page_name]
  end
end
