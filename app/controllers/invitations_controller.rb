class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params.merge!(inviter: current_user))

    if @invitation.save
      MyMailer.send_invitation(@invitation).deliver
      flash[:success] = "Successfuly sent the invitation email."
      redirect_to new_invitation_path
    else
      flash[:danger] = "Something went wrong."
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit!
  end
end