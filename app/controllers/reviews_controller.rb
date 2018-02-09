class ReviewsController < ApplicationController
  def create
    review = Review.find_by(user_id: current_user.id, video_id: params[:video_id])

    if review
      review.update(review_params)
      flash[:warning] = 'Updated your review.'
    else
      Review.create(review_params.merge!(user_id: current_user.id, video_id: params[:video_id]))
      flash[:success] = 'Successfully make a review.'
    end

    redirect_to video_path(params[:video_id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end 
end
