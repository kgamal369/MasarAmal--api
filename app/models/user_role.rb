# == Schema Information
#
# Table name: user_roles
#
#  user_id :integer          not null, primary key
#  role_id :integer          not null, primary key
#
class UserRole < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[user_id role_id]
  end
end
