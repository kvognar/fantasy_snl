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

class TeamMembership < ActiveRecord::Base
  validates :actor, :team, presence: true
  validates :actor, uniqueness: { scope: :team }
  validate :team_is_not_full, on: :create
  
  belongs_to :actor
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
  belongs_to :team, counter_cache: :memberships_count
  
  private
  
  def team_is_not_full
    unless team.team_memberships.size < 4
      errors[:team] << "is full"
    end
  end
end
