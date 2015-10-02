class LeaguesController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]
  before_action :require_league_ownership!, only: :update

  def show
    @league = League.includes(teams: [:members]).find(params[:id])
    @teams = @league.teams.sort { |a, b| b.score <=> a.score }
  end

  def new
    @league = current_user.created_leagues.new
  end

  def create
    @league = current_user.created_leagues.new(league_params)
    if @league.save
      flash[:success] = "League created!"
      redirect_to @league
    else
      flash.now[:danger] = "League could not be created."
      flash.now[:errors] = @league.errors.full_messages
      render :new
    end
  end

  def update
    @league ||= League.find(params[:id])
    if @league.update_attributes(league_params)
      flash[:success] = "League updated."
    else
      flash[:danger] = @league.errors.full_messages.join("; ")
    end
    redirect_to @league
  end

  private

  def league_params
    params.require(:league).permit(:name, :locked)
  end

  def require_league_ownership!
    @league = League.find(params[:id])
    redirect_to root_url unless @league.creator == current_user
  end

end
