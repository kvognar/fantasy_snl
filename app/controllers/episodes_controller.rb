class EpisodesController < ApplicationController
  def new
    @actors = Actor.all
    @scoring_types = ScoringType.all
  end
end
