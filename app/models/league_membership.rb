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

class LeagueMembership < ActiveRecord::Base
  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :member_id,
    primary_key: :id
  )
  belongs_to :league
  
end
