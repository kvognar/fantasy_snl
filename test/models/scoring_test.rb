# == Schema Information
#
# Table name: scorings
#
#  id              :integer          not null, primary key
#  actor_id        :integer          not null
#  scoring_type_id :integer          not null
#  episode_id      :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ScoringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
