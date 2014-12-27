class EpisodesController < ApplicationController
  def new
    @actors = Actor.all
    @scoring_types = ScoringType.all
  end

  def index
    @episodes = Episode.all
  end

  def create
    Episode.transaction do
      @episode = Episode.create!(episode_params)
      score_params["actors"].each do |actor_id, actor_properties|
        actor_properties['scoring_types'].each do |scoring_type_id, scoring_type_properties|
          score_count = scoring_type_properties["count"]
          Integer(score_count).times do
            Scoring.create!(actor_id: actor_id,
                            scoring_type_id: scoring_type_id,
                            episode: @episode)
          end
        end
      end
    end
    render json: @episode
  end

  def show
    @episode = Episode.find(params[:id])
    @actors = Actor.all.includes(scorings: :scoring_type)
  end

  private

  def episode_params
    params.require(:episode).permit(:air_date, :host)
  end

  def score_params
    params.require(:scores).permit(actors: {scoring_types: [:count]} )
  end
end
