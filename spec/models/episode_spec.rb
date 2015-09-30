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

require 'spec_helper'

describe Episode do
  it { should validate_presence_of :host }
  it { should validate_presence_of :air_date }
  it { should have_many :scorings }
  it { should have_one :writeup }
  it 'should have a default scope by air date' do
    late_episode = create(:episode, air_date: 7.days.from_now)
    early_episode = create(:episode, air_date: 7.days.ago)
    now_episode = create(:episode, air_date: Time.now)

    expect(Episode.all).to eq [early_episode, now_episode, late_episode]
  end
end
