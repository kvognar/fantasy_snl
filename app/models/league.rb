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
end
