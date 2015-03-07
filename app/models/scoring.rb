# == Schema Information
#
# Table name: scorings
#
#  id              :integer          not null, primary key
#  actor_id        :integer          not null
#  scoring_type_id :integer          not null
#  episode_id      :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#  team_id         :integer
#

class Scoring < ActiveRecord::Base
  validates :actor, :scoring_type, :episode, presence: true

  scope :canonical, -> { where(team: nil) }

  belongs_to :actor
  belongs_to :scoring_type
  belongs_to :episode
  belongs_to :team

  delegate :value, to: :scoring_type

  after_create :allot_scorings_to_teams, if: Proc.new { |scoring| scoring.team.nil? }

  def allot_scorings_to_teams
    self.actor.teams.each do |team|
      team.scorings << Scoring.new(actor: self.actor, scoring_type: self.scoring_type, episode: self.episode)
    end
  end
end
