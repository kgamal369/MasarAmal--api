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
  def self.ransackable_attributes(auth_object = nil)
    super & %w[user_id username password email full_name registration_date last_login]
  end
end
