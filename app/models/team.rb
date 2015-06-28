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

### counter cache may not be necessary

class Team < ActiveRecord::Base
  validates :name, :owner, :league, :memberships_count, presence: true
  validates :memberships_count, numericality: { less_than_or_equal_to: 4 }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )

  belongs_to :league
  has_many :team_memberships
  has_many :members, through: :team_memberships, source: :actor
  has_many :scorings, dependent: :destroy

  def draft(actor)
    raise "team is full" if memberships_count >= 4
    self.members << actor
    self.league.next_drafter
  end

  def score
    self.scorings.includes(:scoring_type).sum(:value)
  end


end
