FactoryGirl.define do
  factory :league do
    sequence :name do |n|
      "league_#{n}"
    end
    association :creator, factory: :user

    factory :drafting_league do

      after :create do |league, evaluator|
        create_list :league_membership, 3, league: league
        league.reload.members.each do |member|
          create(:team, owner: member, league: league)
        end
        league.lock
      end
    end

  end
end
