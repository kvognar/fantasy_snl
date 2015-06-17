require 'spec_helper'

describe League do
  before :each do
    @league = create(:league)
  end

  it { should have_many :league_memberships }
  it { should have_many :members }
  it { should have_many :teams }
  it { should have_many :draftings }
  it { should belong_to :creator }

  describe '#available_actors' do
    it 'returns a hash of the remaining drafting slots' do
      league = create(:drafting_league)
      2.times { create(:actor) }
      expect(league.available_actors).to eq ({
                                           Actor.first => 2,
                                           Actor.last => 2
                                         })

      Team.first.draft(Actor.first)
      expect(league.reload.available_actors).to eq ({
                                                Actor.first => 1,
                                                Actor.last => 2
                                            })
    end
  end

end
