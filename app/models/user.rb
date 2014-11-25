# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  validates :username, presence: true
  
  has_many :league_memberships, dependent: :destroy
  has_many :teams, dependent: :destroy, foreign_key: :owner_id
  has_many :leagues, through: :league_memberships, source: :league
end
