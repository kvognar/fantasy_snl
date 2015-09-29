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

require 'spec_helper'

describe Season do
  pending "add some examples to (or delete) #{__FILE__}"
end
