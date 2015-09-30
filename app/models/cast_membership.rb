# == Schema Information
#
# Table name: cast_memberships
#
#  id         :integer          not null, primary key
#  actor_id   :integer          not null
#  season_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class CastMembership < ActiveRecord::Base
  belongs_to :season
  belongs_to :actor

  validates_uniqueness_of :actor_id, scope: :season_id
end
