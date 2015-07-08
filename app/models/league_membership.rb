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

class LeagueMembership < ActiveRecord::Base
  validates :member, :league, presence: true
  validates :member_id, uniqueness: { scope: :league_id, message: "has already joined this league!" }
  validate :league_is_unlocked, on: :create
  validate :league_is_not_full, on: :create

  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :member_id,
    primary_key: :id
  )
  belongs_to :league

  private

  def league_is_unlocked
    if league.locked
      errors[:league] << "is locked"
    end
  end

  def league_is_not_full
    if league.members.size >= 6
      errors[:league] << "is full (max 6)"
    end
  end

end
