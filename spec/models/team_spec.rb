# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  owner_id          :integer          not null
#  league_id         :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  memberships_count :integer          default(0), not null
#

require 'spec_helper'

describe Team do

  before do
    @user = User.create(username: "the rubin") 
    @league = League.create(name: "Rubin Rage", creator: @user)
    @team = Team.create(name: "Rubin and the Rubins", owner: @user,
                        league: @league)
                        
    @actors = create_actors
  end
  
  describe "properties" do
    it "should have a name" do
      expect(@actors.first).to respond_to :name
    end
  end
  
  describe "memberships" do
    
    it "should not allow duplicate memberships" do
      membership = TeamMembership.new(team: @team, actor: @actors.first)
      expect(membership).to be_valid
      membership.save!
      
      dup_membership = TeamMembership.new(team: @team, actor: @actors.first)
      expect(dup_membership).not_to be_valid
    end
    
    it "should allow only four members per team" do
      4.times do |i|
        membership = TeamMembership.create(team: @team, actor: @actors[i])
      end
      
      expect(TeamMembership.count).to eq(4)
      @team.reload
      expect(@team).to be_valid
      expect(@team.memberships_count).to eq(4)
      
      expect { TeamMembership.create!(team: @team, actor: @actors[5]) }.to raise_error

      
    end
    
  end
  
end
