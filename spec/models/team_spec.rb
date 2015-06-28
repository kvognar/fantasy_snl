require 'spec_helper'

describe Team do
  it { should belong_to :owner }
  it { should belong_to :league }
  it { should have_many :team_memberships }
  it { should have_many :members }
  it { should have_many :scorings }
  it { should validate_presence_of :name }
  it { should validate_presence_of :owner }
  it { should validate_presence_of :league }
  it { should validate_numericality_of(:memberships_count).is_less_than_or_equal_to 4 }

  describe '#score' do
    it 'should sum the values of the scorings of all its members' do
      team = create(:full_league).teams.first
      scoring_type = create(:scoring_type, value: 2)
      team.members.each do |actor|
        create(:scoring, scoring_type: scoring_type, actor: actor)
      end
      expect(team.score).to eq 8
    end
  end



end
