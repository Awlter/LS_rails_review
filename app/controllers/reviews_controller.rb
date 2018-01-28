class ReviewsController < ApplicationController
  def create
    Review.create(review_params.merge!(user_id: current_user.id))
    redirect_to video_path(review_params[:video_id])
  end

  private

  def review_params
    params.require(:review).permit(:video_id, :content, :rating)
  end 
end
