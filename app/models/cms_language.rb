# app/models/cms_language.rb
class CmsLanguage < ApplicationRecord
  has_many :cms_values

  def self.ransackable_attributes(auth_object = nil)
    ["id", "language_name"]
  end
end
