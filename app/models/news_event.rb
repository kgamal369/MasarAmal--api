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
class NewsEvent < ApplicationRecord
end
