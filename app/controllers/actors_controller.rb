class ActorsController < ApplicationController


  def show
    @actor = Actor.includes(scorings: [:scoring_type, :episode]).find(params[:id])
    @episodes = Episode.all
    @scoring_types = ScoringType.all
  end

  def edit
    #TODO: this
    @actor = Actor.find(params[:id])
  end

end
