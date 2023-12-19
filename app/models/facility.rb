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
class Facility < ApplicationRecord
end
