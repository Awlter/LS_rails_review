class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
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

  def show
    @user = User.includes({reviews: 'video'}, { queue_items: 'video'}).find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
