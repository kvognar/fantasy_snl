FactoryGirl.define do
  factory :team do
    league
    owner
    sequence :name do |n|
      "team_#{n}"
    end
  end
end
