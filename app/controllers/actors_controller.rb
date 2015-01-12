class ActorsController < ApplicationController


  def show
    @actor = Actor.includes(scorings: [:scoring_type, :episode]).find(params[:id])
  end

  def index
    @actors = Actor.includes(scorings: [:scoring_type, :episode]).all
  end

  def edit
    @actor = Actor.find(params[:id])
  end
end
