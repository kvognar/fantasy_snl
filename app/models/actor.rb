# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Actor < ActiveRecord::Base
  has_many :team_memberships, dependent: :destroy
  has_many :scorings, dependent: :destroy
  
  def score
    self.scorings.sum(:value)
  end
end
