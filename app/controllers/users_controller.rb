class UsersController < ApplicationController

  def show
    @user = User.includes(:leagues, teams: {members: {scorings: :scoring_type}}).find(params[:id])
  end
end
