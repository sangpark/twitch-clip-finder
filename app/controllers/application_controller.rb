class ApplicationController < ActionController::Base

  private

  helper_method :current_user
helper_method :logged_in?



  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorized_to_edit?(clip)
    clip.user == current_user
  end

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end

end
