class ActorsController < ApplicationController

  include ScoreBreakdown

  def show
    @actor = Actor.find(params[:id])
    @episodes = Episode.all
    @scorings = @actor.scorings.canonical.includes(:scoring_type)
    @scoring_types = ScoringType.all
    @scores_by_episode = scores_by_episode
    @scorings_by_episode_and_scoring_type = scorings_by_episode_and_scoring_type
  end

  def edit
    #TODO: this
    @actor = Actor.find(params[:id])
  end

  private

  def scores_by_episode
    result = @scorings.group_by(&:episode_id)
    result.each do |episode, scorings|
      result[episode] = scorings.inject(0) { |total, scoring| total + scoring.value }
    end
  end

  def scorings_by_episode_and_scoring_type
    result = @scorings.group_by(&:episode_id)
    result.each do |episode, scorings|
      result[episode] = scorings.group_by(&:scoring_type_id)
    end
  end

end
