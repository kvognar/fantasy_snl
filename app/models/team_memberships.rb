# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer          not null, primary key
#  actor_id   :integer          not null
#  owner_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class TeamMemberships < ActiveRecord::Base
  belongs_to :actor
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )
end
