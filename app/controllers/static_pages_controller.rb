class StaticPagesController < ApplicationController

  def root
    if signed_in?
      @league = current_user.leagues.first
      @team = current_user.teams.includes(members: { scorings: :scoring_type } ).first
    end
    @actors = Actor.all
    @episodes = Episode.all
  end
end
