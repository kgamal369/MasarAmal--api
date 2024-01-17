# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  user_id           :integer          not null, primary key
#  username          :string           not null
#  password          :string           not null
#  email             :string           not null
#  full_name         :string
#  registration_date :datetime
#  last_login        :datetime
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
