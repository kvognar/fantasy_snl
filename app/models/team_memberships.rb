# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer          not null, primary key
#  actor_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  team_id    :integer          not null
#

class TeamMemberships < ActiveRecord::Base
  belongs_to :actor
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
  belongs_to :team, counter_cache: :memberships_count
end
