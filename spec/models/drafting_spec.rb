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
    @users, @league, @teams = initialize_league
    
    @user = @users.first
    @team = @teams.first
                        
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
  
  describe "joining leagues" do
  
    it "should allow joining an unlocked league" do
      @users[1..2].each do |user|
        @league.members << user
      end
      expect(@league.members.size).to eq(3)
    end
  
    it "should not allow joining a locked league" do
      @league.lock
      expect { @league.members << @users.last }.to raise_error
    end
  
    it "should only allow 4 members per league" do
      @users.drop(1).each { |user| @league.members << user }
      expect(@league.members.size).to eq(4)
    
      fifth_wheel = User.new(username: "Donald")
      expect { @league.members << fifth_wheel }.to raise_error
    end
  end
  
  describe "drafting" do
    before { @users.drop(1).each { |user| @league.members << user } }
    
    it "gives each member a different ord value from 1 to 4" do
      @league.lock
      ords = @league.league_memberships.map { |user| user.ord }
      expect(ords.sort).to eq([1, 2, 3, 4])
    end
    
    it "allows each actor to be drafted only twice" do
      draft_count = @league.available_actors.inject(0) do |count, actor|
        count + actor[1]
      end
      # 13 actors, 2 draftings each
      expect(draft_count).to eq(26)
    end
    
    it "adds a drafted actor to the user's team" 
    
    it "does not allow duplicate drafting"
    
    it "passes the turn to the next user after a drafting"
  end
  
  
end


