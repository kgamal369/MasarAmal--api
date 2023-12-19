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
require "test_helper"

class NewsEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
