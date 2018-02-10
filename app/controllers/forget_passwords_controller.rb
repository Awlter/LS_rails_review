class ForgetPasswordsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      user.add_reset_token
      MyMailer.delay.forget_password(user)
    end

    redirect_to root_path
  end
end
