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
class Doctor < ApplicationRecord
end
