class TeamMembershipsController < ApplicationController
  before_action :require_signed_in!

  def create
    team = Team.find_by(owner_id: current_user.id, league_id: drafting_params[:league_id])
    team.draft(Actor.find(drafting_params[:actor_id]))
    if team.league.drafting && team.league.current_drafter != current_user
      UserMailer.drafting_turn_email(team.league.current_drafter, team.league).deliver
    end
    redirect_to team.league
  end

  def drafting_params
    params.require(:drafting).permit(:league_id, :actor_id)
  end
end
