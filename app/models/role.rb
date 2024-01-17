# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  role_id   :integer          not null, primary key
#  role_name :string           not null
#
class Role < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[role_id role_name]
  end
end
