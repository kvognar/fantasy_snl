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
  validates :name, :creator_id, presence: true
  
  belongs_to(
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )
  
  has_many :league_memberships, dependent: :destroy
  has_many :members, through: :league_memberships, source: :member
  
  after_create :add_creator_to_league
  
  private
  
  def add_creator_to_league
    self.members << self.creator
  end
  
end
