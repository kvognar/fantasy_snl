# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer          not null, primary key
#  actor_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  team_id    :integer          not null
#

require 'test_helper'

class TeamMembershipsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
