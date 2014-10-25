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
  has_many :league_memberships
  has_many :teams
  has_many :leagues, through: :league_memberships, source: :league
end
