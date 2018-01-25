class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to home_path if logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congrats! You have successfully registered on myflix!"
      redirect_to sign_in_path
    else
      flash.now[:error] = "Some thing wrong with the inputs"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
