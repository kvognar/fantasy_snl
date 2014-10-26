# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  air_date       :date             not null
#  episode_number :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Episode < ActiveRecord::Base
  has_many :scorings, dependent: :destroy
end
