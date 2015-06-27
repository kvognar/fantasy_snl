require 'spec_helper'

describe ScoringType do
  it { should validate_presence_of :description }
  it { should validate_presence_of :value }
  it { should validate_presence_of :symbol }
  it { should have_many :scorings }
end
