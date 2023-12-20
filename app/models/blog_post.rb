# == Schema Information
#
# Table name: blog_posts
#
#  id            :integer          not null, primary key
#  header        :string           not null
#  text          :text
#  last_modified :datetime
#
# app/models/blog_post.rb
class BlogPost < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
      super & %w[header text last_modified]
    end
  end
