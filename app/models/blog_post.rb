# == Schema Information
#
# Table name: blog_posts
#
#  id            :integer          not null, primary key
#  header        :string           not null
#  text          :text
#  last_modified :datetime
#
class BlogPost < ApplicationRecord
end
