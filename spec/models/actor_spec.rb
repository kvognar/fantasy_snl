# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Actor do
  it { should have_many :team_memberships }
  it { should have_many :teams }
  it { should have_many :scorings }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  describe '#score' do
    it 'sums the values of its canonical scores' do
      create(:full_league)
      actor = Actor.first
      scoring_types = [1, 2, 3].map { |i| create(:scoring_type, value: i ) }
      scoring_types.each { |scoring_type| create(:scoring, actor: actor, scoring_type: scoring_type) }
      expect(actor.score).to eq(6)
    end
  end

  describe '#score_by_episode' do
    it 'sums the values of its canonical scores for a given episode' do
      actor = create(:actor)
      scoring_types = [1, 2].map { |i| create(:scoring_type, value: i) }
      scoring_types.each { |scoring_type| create(:scoring,
                                                 actor: actor,
                                                 scoring_type: scoring_type,
                                                 episode: create(:episode)) }
      expect(actor.score_by_episode(Episode.first)).to eq(1)
      expect(actor.score_by_episode(Episode.last)).to eq(2)
    end
  end

end
