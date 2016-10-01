class StaticPagesController < ApplicationController

  def root
    if signed_in?
      @league = current_user.leagues.first
      @team = current_user.teams.first
    end
    @actors = Actor.active
    @episodes = Episode.all
  end

  def faq
    render :faq
  end
end
