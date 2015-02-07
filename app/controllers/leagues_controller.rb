class LeaguesController < ApplicationController

  def show
    @league = League.includes(teams: {members: {scorings: :scoring_type}}).find(params[:id])
    @teams = @league.teams.sort { |a, b| b.score <=> a.score }
  end
end
