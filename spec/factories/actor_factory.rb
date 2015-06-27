# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :actor do
    sequence :name do |n|
      "actor_#{n}"
    end
  end
end
