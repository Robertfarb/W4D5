class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],
    params[:user][:password])

    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Incorrect Username or Password']
      render :new
    end
  end

  def destroy
    logout_user(current_user)
    redirect_to new_session_url
  end

  def new
    @user = User.new
    render :new
  end
end
