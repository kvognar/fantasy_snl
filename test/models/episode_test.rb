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

require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
