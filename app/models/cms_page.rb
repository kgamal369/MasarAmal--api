# frozen_string_literal: true

# app/models/cms_page.rb
class CmsPage < ApplicationRecord
  has_many :page_sections, class_name: 'CmsPageSection', dependent: :destroy
  validates :pagename, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id pagename]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['page_sections']
  end
end
