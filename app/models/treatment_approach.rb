# == Schema Information
#
# Table name: treatment_approaches
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  last_modified :datetime
#
class TreatmentApproach < ApplicationRecord
end
