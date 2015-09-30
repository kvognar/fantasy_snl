# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  owner_id          :integer          not null
#  league_id         :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  memberships_count :integer          default(0), not null
#

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
      league = create(:full_league)
      team = league.teams.first
      season = league.season
      episode = create(:episode, season: season)
      Actor.all.each { |actor| actor.seasons << league.season}
      scoring_type = create(:scoring_type, value: 2)
      team.members.each do |actor|
        episode.scorings.create(scoring_type: scoring_type, actor: actor)
      end
      # binding.pry
      expect(team.score).to eq 8
    end
  end



end
