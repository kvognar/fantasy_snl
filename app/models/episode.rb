# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  air_date       :date             not null
#  episode_number :integer
#  created_at     :datetime
#  updated_at     :datetime
#  host           :string(255)      not null
#  season_id      :integer          default(1), not null
#

class Episode < ActiveRecord::Base
  has_many :scorings, dependent: :destroy
  has_one :writeup
  belongs_to :season
  validates :air_date, :host, :season, presence: true
  validates :air_date, uniqueness: true

  default_scope { order(air_date: :asc) }
end
