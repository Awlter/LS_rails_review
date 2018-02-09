class ForgetPasswordsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      user.add_reset_token
      MyMailer.forget_password(user).deliver
    end

    redirect_to root_path
  end
end
