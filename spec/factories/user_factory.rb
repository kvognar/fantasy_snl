FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "user_#{n}"
    end
    password "widdershins"
  end
end