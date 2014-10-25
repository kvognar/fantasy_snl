# == Schema Information
#
# Table name: scoring_types
#
#  id          :integer          not null, primary key
#  description :string(255)      not null
#  value       :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class ScoringType < ActiveRecord::Base
end
