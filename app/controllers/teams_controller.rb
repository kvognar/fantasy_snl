class TeamsController < ApplicationController

  def show
    @team = Team.includes(members: { scorings: [:scoring_type, :episode] }).find(params[:id])
    @scoring_types = ScoringType.all
    @scorings = @team.scorings
    @episodes = Episode.all
  end

  def episode_scorings(episode)
    @scorings.select { |scoring| scoring.episode == episode }
  end

  def episode_total(episode)
    episode_scorings(episode).map { |s| s.value }.inject(:+)
  end

  helper_method :episode_scorings, :episode_total
end
