# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
