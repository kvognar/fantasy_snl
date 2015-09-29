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
#  season_id             :integer          default(1), not null
#

FactoryGirl.define do
  factory :league do
    sequence :name do |n|
      "league_#{n}"
    end
    association :creator, factory: :user
    season_id 1

    factory :drafting_league do

      after :create do |league, evaluator|
        create_list :league_membership, 3, league: league
        league.reload.members.each do |member|
          create(:team, owner: member, league: league)
        end
        league.update(locked: true)
      end
    end

    factory :full_league do
      after :create do |league, evaluator|
        create_list :league_membership, 3, league: league
        league.reload.members.each do |member|
          create(:team, owner: member, league: league)
        end
        league.update(locked: true)
        16.times do
          team = league.reload.current_drafter.teams.first
          team.draft(create(:actor))
        end
      end
    end

  end
end
