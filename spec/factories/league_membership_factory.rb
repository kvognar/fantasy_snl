FactoryGirl.define do
  factory :league_membership do
    league
    association :member, factory: :user
  end
end
