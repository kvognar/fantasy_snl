require 'spec_helper'

describe ActorsController do
  before do
    @actor = create(:actor)
    @episode = create(:episode)
    @scoring_type = create(:scoring_type)
  end

  describe '#show' do
    it 'renders the show page' do
      get :show, id: @actor.id
      expect(assigns(:actor)).to eq @actor
      expect(assigns(:episodes)).to eq [@episode]
      expect(assigns(:scoring_types)).to eq [@scoring_type]
      expect(response).to render_template(:show)
    end
  end
end
