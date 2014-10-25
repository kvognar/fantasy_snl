# == Schema Information
#
# Table name: league_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer          not null
#  league_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class LeagueMembershipsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
