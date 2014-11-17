# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  before do 
    @user = User.create(username: "the rubin") 
    @other_user = User.create(username: "som")
  end
  subject { @user }
  it { should be_valid }
  
  it "has a username" do
    expect(@user.username).to eq("the rubin")
  end
  
  describe "leagues" do
    before do 
      @league = League.create(name: "Rubin Rage", creator: @user)
    end
    
    it "should be a member of created leagues" do
      expect(@league.members).to include(@user)
    end
    
    it "should add new users to leagues" do
      @league.members << @other_user
      expect(@league.members).to include(@other_user)
    end
    
    
    describe "team ownership" do
      before do
        @team = Team.create(name: "Rubin and the Rubins", owner: @user,
                            league: @league)
      end
    
      it "should own a team" do
        expect(@team.owner).to eq(@user)
      end
    
    end
    
  end
  
    
  
end
