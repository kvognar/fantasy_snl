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

class Actor < ActiveRecord::Base
  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships, source: :team
  has_many :scorings, dependent: :destroy
  has_many :cast_memberships
  has_many :seasons, through: :cast_memberships, source: :season

  validates :name, presence: true, uniqueness: true

  scope :active, -> { joins(:seasons).where(seasons: { is_active: true } ) }
  scope :by_season, ->(season) { joins(:seasons).where(seasons: { id: season.id } ) }

  def score
    self.scorings.canonical.includes(:scoring_type).sum(:value)
  end

  def score_by_season(season_id)
    self.scorings.canonical.includes(:episode, :scoring_type).where(episodes: { season_id: season_id } ).sum(:value)
  end

  def score_by_episode(episode_id)
    self.scorings.canonical.where(episode_id: episode_id).includes(:scoring_type).sum(:value)
  end
end
