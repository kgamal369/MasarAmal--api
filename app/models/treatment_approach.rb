# frozen_string_literal: true

# == Schema Information
#
# Table name: treatment_approaches
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  last_modified :datetime
#
# app/models/treatment_approach.rb
class TreatmentApproach < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[name text last_modified]
  end
end
