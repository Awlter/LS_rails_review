class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
  def new
    @user =  User.new
    redirect_to home_path if logged_in?
  end

  def new_with_token
    invitation = Invitation.find_by_token(params[:token])
    @user = User.new(email: invitation.recipient_email, full_name: invitation.recipient_name)
    @invitation_token = invitation.token
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      handle_invitation(@user)
      MyMailer.success_registration(@user)
      flash[:success] = "Congrats! You have successfully registered on myflix!"
      redirect_to sign_in_path
    else
      flash.now[:error] = "Some thing wrong with the inputs"
      render :new
    end
  end

  def show
    @user = User.includes({reviews: 'video'}, { queue_items: 'video'}).find_by_token(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :invitation_token)
  end

  def handle_invitation(user)
    if user.invitation_token
      invitation = Invitation.find_by_token(user.invitation_token)
      inviter = invitation.inviter
      inviter.follow(user.id)
      user.follow(inviter.id)
      invitation.update_column('token', nil)
    end
  end
end
