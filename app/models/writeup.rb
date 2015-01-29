# == Schema Information
#
# Table name: writeups
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text             not null
#  episode_id :integer
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Writeup < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :episode
  validates :author, :body, presence: true
end
