# app/models/cms.rb
class Cms < ApplicationRecord
    self.table_name = 'cmses'
    self.inheritance_column = :cms_type
    validates_presence_of :PageName, :Language, :Location, :Type, :Value
    def self.ransackable_attributes(auth_object = nil)
      ["language", "last_modified_date", "location", "pagename", "type", "value"]
    end
  end
  