class RelationshipsController < ApplicationController
  before_action :require_login

  def create
    relationship = Relationship.new(leader_id: params[:leader_id], follower_id: current_user.id)
    if relationship.save
      flash[:success] = "Followed this user successfully!"
    else
      flash[:danger] = "You cann't follow the same person twice."
    end
    redirect_to user_path(params[:leader_id])
  end
end
