require 'spec_helper'

describe Scoring do
  it { should belong_to :actor }
  it { should belong_to :scoring_type }
  it { should belong_to :episode }
  it { should belong_to :team }
  it { should belong_to :canonical_scoring }
  it { should have_many :dependent_scorings }

  its "dependent_scorings should be destroyed if it's destroyed" do
    create(:full_league)
    scoring = create(:scoring, actor: Actor.first)
    expect(Scoring.count).to eq(2)
    scoring.destroy
    expect(Scoring.count).to eq(0)
  end

  describe '#allot_scorings_to_team' do
    it "should create depending scorings for each team that has drafted the scoring's actor" do
      create(:full_league)
      scoring = create(:scoring, actor: Actor.first)
      team = Team.includes(:team_memberships).find_by(team_memberships: { actor: Actor.first })
      scoring_2 = team.scorings.first

      expect(scoring_2.actor).to eq scoring.actor
      expect(scoring_2.scoring_type).to eq scoring.scoring_type
      expect(scoring_2.episode).to eq scoring.episode
      expect(scoring.dependent_scorings).to include(scoring_2)
    end
  end

end
