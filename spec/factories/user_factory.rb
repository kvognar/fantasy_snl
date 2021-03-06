# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#  password_hash :string(255)      not null
#  session_token :string(255)      not null
#  is_admin      :boolean          default(FALSE), not null
#  email         :string(255)
#

FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence :username do |n|
      "user_#{n}"
    end
    password "widdershins"
    sequence :email do |n|
      "winter_winds#{n}@poeticjustice.com"
    end
  end
end
