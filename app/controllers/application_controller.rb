class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :is_admin

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    current_user != nil
  end

  def sign_in!(user)
    session[:token] = user.reset_session_token!
  end

  def sign_out!
    current_user.try(:reset_session_token)
    session[:token] = nil
  end

  def require_admin!
    redirect_to root_url unless current_user.is_admin
  end

  def require_signed_in!
    redirect_to root_url unless signed_in?
  end
end
