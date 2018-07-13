class UsersController < ApplicationController

  def create
    debugger
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      redirect_to new_user_url
    end
  end

  def index
    @users = User.all
    render :index
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
