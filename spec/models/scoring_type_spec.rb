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

require 'spec_helper'

describe ScoringType do
  it { should validate_presence_of :description }
  it { should validate_presence_of :value }
  it { should validate_presence_of :symbol }
  it { should have_many :scorings }
end
