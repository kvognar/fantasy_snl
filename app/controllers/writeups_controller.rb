class WriteupsController < ApplicationController

  before_action :require_admin!

  def new
    @writeup = Writeup.new(episode_id: params[:episode_id])
  end

  def edit
    @writeup = Writeup.find(params[:id])
  end

  def create
    @writeup = current_user.writeups.new(writeup_params)
    if @writeup.save
      redirect_to @writeup.episode
    else
      flash[:danger] = "The writeup could not be saved."
      flash[:errors] = @writeup.errors.full_messages
      render :new
    end
  end

  def update
    @writeup = Writeup.find(params[:id])
    if @writeup.update_attributes(writeup_params)
      redirect_to @writeup.episode
    else
      flash[:errors] = @writeup.errors.full_messages
      render :edit
    end
  end

  private

  def writeup_params
    params.require(:writeup).permit(:episode_id, :title, :body)
  end
end
