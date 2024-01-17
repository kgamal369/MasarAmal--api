# frozen_string_literal: true

# == Schema Information
#
# Table name: doctors
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  pictures      :string
#  last_modified :datetime
#
require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
