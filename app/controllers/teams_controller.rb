class TeamsController < ApplicationController

  before_action :require_signed_in!, only: :create

  def show
    @team = Team.includes(members: { scorings: [:scoring_type, :episode] }).find(params[:id])
    @scoring_types = ScoringType.all
    @scorings = @team.scorings
    @episodes = Episode.all
  end

  def create
    @team = current_user.teams.new(team_params)
    if @team.league.invite_token == params[:league][:invite_token]
      if @team.save
        flash[:success] = "Team created. Now add its first member!"
      else
        flash[:danger] = "Team could not be created."
        flash[:errors] = @team.errors.full_messages
      end
    else
      flash[:danger] = "Someone is being tricksy."
    end
    redirect_to @team.league
  end

  def episode_scorings(episode)
    @scorings.select { |scoring| scoring.episode == episode }
  end

  def episode_total(episode)
    episode_scorings(episode).map { |s| s.value }.inject(:+)
  end

  helper_method :episode_scorings, :episode_total

  private

  def team_params
    params.require(:team).permit(:name, :league_id)
  end
end
