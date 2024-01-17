# frozen_string_literal: true

# app/models/cms_language.rb
class CmsLanguage < ApplicationRecord
  has_many :cms_values, foreign_key: 'languageid'

  def self.ransackable_attributes(_auth_object = nil)
    %w[id language_name]
  end
end
