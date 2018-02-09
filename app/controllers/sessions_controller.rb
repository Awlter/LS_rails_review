class SessionsController < ApplicationController
  def new
    redirect_to home_path if logged_in?
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to home_path
    else
      flash.now[:danger] = "Something went wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Logged out!"
    redirect_to root_path
  end
end
