class EpisodesController < ApplicationController
  def new
    @actors = Actor.all
    @scoring_types = ScoringType.all
    @seasons = Season.all
  end

  def create
    Episode.transaction do
      @episode = Episode.new(episode_params)
      if @episode.save
        score_params['actors'].each do |actor_id, actor_properties|
          actor_properties['scoring_types'].each do |scoring_type_id, scoring_type_properties|
            score_count = scoring_type_properties['count']
            Integer(score_count).times do
              Scoring.create!(actor_id: actor_id,
                              scoring_type_id: scoring_type_id,
                              episode: @episode)
            end
          end
        end
        redirect_to @episode
      else
        flash[:danger] = "The episode couldn't be created."
        flash[:errors] = @episode.errors.full_messages
        redirect_to new_episode_path
      end
    end
  end

  def show
    @episode = Episode.find(params[:id])
    @actors = Actor.all
    @scores_by_actor = @episode.scorings.canonical
                           .includes(:scoring_type)
                           .group(:actor_id)
                           .sum(:value)
  end

  private

  def episode_params
    params.require(:episode).permit(:air_date, :host, :season_id)
  end

  def score_params
    params.require(:scores).permit(actors: { scoring_types: [:count] } )
  end

end
