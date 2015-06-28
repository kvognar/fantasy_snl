FactoryGirl.define do
  factory :episode do
    sequence :air_date do |n|
      (n+1).years.from_now
    end
    host "The Rubin"
  end
end
