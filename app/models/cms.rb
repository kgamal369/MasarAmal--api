# app/models/cms.rb
class Cms < ApplicationRecord  
    def self.ransackable_attributes(auth_object = nil)
      super & %w[PageName Language Location Type Value Last_modified_date]
    end
  end
  