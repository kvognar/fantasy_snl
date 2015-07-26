class UsersController < ApplicationController

  def show
    @user = User.includes(:leagues, teams: {members: {scorings: :scoring_type}}).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password != params[:user][:confirm_password]
      flash.now[:info] = "Your passwords did not match!"
      render :new
    else
      if @user.save
        flash[:success] = "Welcome to Fantasy SNL!"
        sign_in!(@user)
        redirect_to root_url
      else
        flash.now[:danger] = "We could not create your account."
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.is_password?(password_params[:old_password])
      if password_params[:new_password] == password_params[:confirm_password]
        if current_user.update_attributes(password: password_params[:new_password])
          flash[:success] = "Password changed!"
        else
          flash.now[:danger] = "Password could not be changed."
          flash.now[:errors] = current_user.errors.full_messages
        end
      else
        flash.now[:danger] = "Your passwords didn't match :("
      end
    else
      flash.now[:danger] = "That's not your old password!"
    end

    if flash[:success]
      redirect_to current_user
    else
      @user = current_user
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:old_password, :new_password, :confirm_password)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
