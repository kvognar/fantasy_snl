# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  owner_id          :integer          not null
#  league_id         :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  memberships_count :integer          default(0), not null
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
