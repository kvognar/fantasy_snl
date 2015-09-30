# == Schema Information
#
# Table name: seasons
#
#  id            :integer          not null, primary key
#  year          :integer          not null
#  season_number :integer          not null
#  is_active     :boolean          default(FALSE), not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Season < ActiveRecord::Base
  has_many :episodes
  has_many :leagues
  has_many :cast_memberships
  has_many :actors, through: :cast_memberships, source: :actor

  scope :active, -> { where(is_active: true) }

  validates :year, :season_number, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates_uniqueness_of :year
  validates_uniqueness_of :season_number

end
