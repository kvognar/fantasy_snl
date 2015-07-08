# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  owner_id          :integer          not null
#  league_id         :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  memberships_count :integer          default(0), not null
#

FactoryGirl.define do
  factory :team do
    league
    owner
    sequence :name do |n|
      "team_#{n}"
    end
  end
end
