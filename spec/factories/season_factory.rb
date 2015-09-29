FactoryGirl.define do
  factory :season do
    is_active false
    sequence :year do |n|
      1970 + n
    end
    sequence :season_number do |n|
      n
    end
  end
end
