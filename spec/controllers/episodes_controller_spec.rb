require 'spec_helper'

describe EpisodesController do

  before do
    @season = create(:season)
    @actors = [1, 2, 3].map { create(:actor) }
    @scoring_types = [1, 2, 3].map { |i| create(:scoring_type, value: i) }
  end

  describe '#new' do
    it 'renders the New Episode page' do
      get :new
      expect(assigns(:actors)).to eq @actors
      expect(assigns(:scoring_types)).to eq @scoring_types
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    it 'creates and episode and distributes the scores' do
      post(:create,
           episode: {
               air_date: 1.day.ago,
               host: 'The Rubin',
               season_id: @season.id
                  },
           scores: {
               actors: {
                   Actor.first.id.to_s => {
                       scoring_types: {
                           @scoring_types.first.id.to_s => {
                               count: '1'
                           }
                       }
                   },
                   Actor.last.id.to_s => {
                       scoring_types: {
                           @scoring_types.last.id.to_s => {
                               count: '1'
                           }
                       }
                   }

               }
           }
      )
      expect(Scoring.count).to eq(2)
      expect(Actor.first.score).to eq(1)
      expect(Actor.last.score).to eq(3)
      expect(response).to redirect_to(Episode.first)

    end
  end

  describe '#show' do
    it 'renders the show page' do
      episode = create(:episode)
      get :show, id: episode.id
      expect(assigns[:episode]).to eq episode
      expect(assigns[:actors]).to eq @actors
    end
  end

end
