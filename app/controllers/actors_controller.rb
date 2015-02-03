class ActorsController < ApplicationController


  def show
    @actor = Actor.includes(scorings: [:scoring_type, :episode]).find(params[:id])
    @episodes = Episode.all
    @scoring_types = ScoringType.all
  end

  def index
    @actors = Actor.includes(scorings: [:scoring_type, :episode]).all
  end

  def edit
    @actor = Actor.find(params[:id])
  end
end
