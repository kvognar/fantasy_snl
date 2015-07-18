class LeagueMembershipsController < ApplicationController
  before_action :require_signed_in!

  def create
    @league = League.find(params[:league_id])
    if @league.invite_token == params[:invite_token]
      membership = @league.league_memberships.new(member: current_user)
      if membership.save
        flash[:success] = "Welcome! You have joined #{@league.name}"
      else
        flash[:danger] = "Whoops. You can't join this league."
        flash[:errors] = membership.errors.full_messages
      end
    else
      flash[:danger] = "You aren't invited to this league!"
    end
    redirect_to @league
  end


end
