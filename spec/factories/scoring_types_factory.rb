FactoryGirl.define do
  factory :scoring_type do
    sequence :description do |n|
      "scoring type #{n}"
    end
    value 1
    sequence :symbol do |n|
      "S#{n}"
    end
  end
end
