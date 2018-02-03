class QueueItem < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  validates :position, numericality: { only_integer: true }

  def video_title
    video.title
  end

  def video_category
    video.category.name
  end

  def rating
    review.try(:rating)
  end

  def rating=(to_rating)
    if review.blank?
      new_review = user.reviews.new(video: video, user: user, rating: to_rating)
      new_review.save
    else
      review.update(rating: to_rating)
    end
  end

  private

  def review
    @review ||= video.reviews.find_by(user: user)
  end
end