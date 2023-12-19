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
class User < ApplicationRecord
end
