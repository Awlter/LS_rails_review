class RelationshipsController < ApplicationController
  before_action :require_login

  def index
    @leaders = User.includes(:following_relationships).find_by(id: current_user.id).leaders
  end

  def create
    leader = User.find(params[:leader_id])
    relationship = Relationship.new(leader: leader, follower: current_user)
    if relationship.save
      flash[:success] = "Followed this user successfully!"
    else
      flash[:danger] = "You cann't follow the same person twice."
    end
    redirect_to leader
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
