# == Schema Information
#
# Table name: scorings
#
#  id              :integer          not null, primary key
#  actor_id        :integer          not null
#  scoring_type_id :integer          not null
#  episode_id      :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Scoring < ActiveRecord::Base
  validates :actor, :scoring_type, :episode, presence: true
  
  belongs_to :actor
  belongs_to :scoring_type
  belongs_to :episode
end
