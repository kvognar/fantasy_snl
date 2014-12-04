class LeaguesController < ApplicationController
  
  def show
    @league = League.includes(teams: {members: {scorings: :scoring_type}}).find(params[:id])
    @teams = @league.teams
    
    
  end
end
