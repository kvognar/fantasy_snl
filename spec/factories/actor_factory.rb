FactoryGirl.define do
  factory :actor do
    sequence :name do |n|
      "actor_#{n}"
    end
  end
end
