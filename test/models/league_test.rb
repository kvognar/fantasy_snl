# == Schema Information
#
# Table name: leagues
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  creator_id         :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#  locked             :boolean          default(FALSE), not null
#  drafting           :boolean          default(FALSE), not null
#  drafting_direction :integer          default(1), not null
#  current_drafter_id :integer          default(1), not null
#

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
