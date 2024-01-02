# app/models/cms.rb
class Cms < ApplicationRecord
  self.table_name = 'cmses'
  self.inheritance_column = :cms_type
  validates_presence_of :pagename, :language, :location, :type, :value
  def self.ransackable_attributes(_auth_object = nil)
    %w[language last_modified_date location pagename type value]
  end
end
