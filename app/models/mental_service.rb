# == Schema Information
#
# Table name: mental_services
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  text          :text
#  last_modified :datetime
#
class MentalService < ApplicationRecord
end
