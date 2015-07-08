# == Schema Information
#
# Table name: leagues
#
#  id                    :integer          not null, primary key
#  name                  :string(255)      not null
#  creator_id            :integer          not null
#  created_at            :datetime
#  updated_at            :datetime
#  locked                :boolean          default(FALSE), not null
#  drafting              :boolean          default(FALSE), not null
#  drafting_direction    :integer          default(0), not null
#  current_drafter_index :integer          default(1), not null
#  invite_token          :string(255)
#  drafting_order        :text             default([]), is an Array
#

require 'spec_helper'

describe League do
  before :each do
    @league = create(:league)
    @drafting_league = create(:drafting_league)
  end

  it { should have_many :league_memberships }
  it { should have_many :members }
  it { should have_many :teams }
  it { should have_many :draftings }
  it { should belong_to :creator }

  describe '#available_actors' do
    it 'returns a hash of the remaining drafting slots' do
      2.times { create(:actor) }
      expect(@drafting_league.available_actors).to eq ({
                                           Actor.first => 2,
                                           Actor.last => 2
                                         })

      Team.find_by(league: @drafting_league, owner: @drafting_league.current_drafter).draft(Actor.first)

      expect(@drafting_league.reload.available_actors).to eq ({
                                                Actor.first => 1,
                                                Actor.last => 2
                                            })
    end
  end

  describe '#current_drafter' do
    it 'selects a league member from the drafting_order array' do
      create(:actor)
      @drafting_league.drafting_order = @drafting_league.member_ids.sort
      expect(@drafting_league.current_drafter).to eq(User.find(@drafting_league.member_ids.first))
      @drafting_league.current_drafter
    end
  end

  describe '#next_drafter' do

    it 'shifts the current drafter index in a serpentine manner' do
      [0, 1, 2, 3, 3, 2, 1, 0, 0, 1].each do |index|
        expect(@drafting_league.current_drafter_index).to eq index
        @drafting_league.next_drafter
      end
    end
  end

  describe '#end_drafting_if_finished' do
    it 'ends drafting if the current drafting team is full' do
      league = create(:full_league)
      league.update(drafting: true)
      league.end_drafting_if_finished
      expect(league.drafting).to be_false
    end

    it 'does not end drafting if the current drafting team is not full' do
      league = create(:full_league)
      league.current_drafter.teams.first.team_memberships.first.destroy
      league.update(drafting: true)
      league.end_drafting_if_finished
      expect(league.drafting).to be_true
    end
  end

end
