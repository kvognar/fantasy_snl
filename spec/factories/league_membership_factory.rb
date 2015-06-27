# == Schema Information
#
# Table name: league_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer          not null
#  league_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :league_membership do
    league
    association :member, factory: :user
  end
end
