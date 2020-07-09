class UsersController < ApplicationController
#redirect_if_not_logged_in
#skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if (user = User.new(user_params))
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
  redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
  #  redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
