# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  creator_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class League < ActiveRecord::Base
  belongs_to(
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )
end
