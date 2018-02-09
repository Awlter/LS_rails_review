class PasswordResetsController < ApplicationController
  def show
    @user = User.find_by_reset_token(params[:id])
    if @user
      @user.update_column("reset_token", nil)
    else
      redirect_to expired_token_path
    end
  end
  def create
    user = User.find_by_token(params[:token])
    user.password = params[:password]

    if user.save
      flash[:success] = "You have reset your password successfully."
      redirect_to sign_in_path
    else
      user.add_reset_token
      flash[:danger] = "Something wrong with your input."
      redirect_to password_reset_path(user.reset_token)
    end
  end
end
