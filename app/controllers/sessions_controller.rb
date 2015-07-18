class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(session_params)
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:warning] = "Sorry, your password or username is incorrect."
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
