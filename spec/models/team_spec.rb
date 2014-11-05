require 'spec_helper'

describe Team do

  before do
    @user = User.create(username: "the rubin") 
    @league = League.create(name: "Rubin Rage", creator: @user)
    @team = Team.create(name: "Rubin and the Rubins", owner: @user,
                        league: @league)

  end
  
end
