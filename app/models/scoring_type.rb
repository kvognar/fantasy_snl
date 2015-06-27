# == Schema Information
#
# Table name: scoring_types
#
#  id          :integer          not null, primary key
#  description :string(255)      not null
#  value       :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  symbol      :string(255)
#

class ScoringType < ActiveRecord::Base
  validates :description, :value, :symbol, presence: true
  has_many :scorings
end
