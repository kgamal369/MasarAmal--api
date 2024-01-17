# frozen_string_literal: true

# == Schema Information
#
# Table name: blog_posts
#
#  id            :integer          not null, primary key
#  header        :string           not null
#  text          :text
#  last_modified :datetime
#
require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
