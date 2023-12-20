# == Schema Information
#
# Table name: news_events
#
#  id             :integer          not null, primary key
#  header         :string           not null
#  text           :text
#  date_of_events :date
#  last_modified  :datetime
#
# app/models/news_event.rb
class NewsEvent < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
      super & %w[header text date_of_events last_modified]
    end
  end
  
