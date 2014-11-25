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
  validates :actor_id, uniqueness: { scope: :team_id }
  validate :team_is_not_full, on: :create
  validate :owner_has_current_turn, on: :create
  
  belongs_to :actor
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
  belongs_to :team, counter_cache: :memberships_count
  has_one :league, through: :team, source: :team
  
  private
  
  def team_is_not_full
    unless team.team_memberships.size < 4
      errors[:team] << "is full"
    end
  end
  
  def owner_has_current_turn
    unless self.league.current_drafter_id == self.team.owner_id
      errors[:team] << "isn't ready yet"
    end
  end
end
