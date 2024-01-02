# == Schema Information
#
# Table name: facilities
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  pictures      :string
#  last_modified :datetime
#
# app/models/facility.rb
class Facility < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[name text pictures last_modified]
  end
end
