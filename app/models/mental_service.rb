# frozen_string_literal: true

# == Schema Information
#
# Table name: mental_services
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  last_modified :datetime
#
# app/models/mental_service.rb
class MentalService < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    super & %w[name text last_modified]
  end
end
