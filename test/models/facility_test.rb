# == Schema Information
#
# Table name: facilities
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  pictures      :string
#  last_modified :datetime
#
require "test_helper"

class FacilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
