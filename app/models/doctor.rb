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
# app/models/doctor.rb
class Doctor < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[name text pictures last_modified]
  end
end
