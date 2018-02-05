class RelationshipsController < ApplicationController
  before_action :require_login

  def index
    @leaders = User.includes(:following_relationships).find_by(id: current_user.id).leaders
  end

  def create
    relationship = Relationship.new(leader_id: params[:leader_id], follower_id: current_user.id)
    if relationship.save
      flash[:success] = "Followed this user successfully!"
    else
      flash[:danger] = "You cann't follow the same person twice."
    end
    redirect_to user_path(params[:leader_id])
  end

  def destroy
    relationship = Relationship.find(params[:id])
    if relationship.follower == current_user
      flash[:success] = "Unfollowed this user successfully!"
      relationship.destroy
    else
      flash[:danger] = "You cann't do this"
    end
    redirect_to people_path
  end
end
