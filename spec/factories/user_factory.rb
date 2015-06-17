FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence :username do |n|
      "user_#{n}"
    end
    password "widdershins"
  end
end
