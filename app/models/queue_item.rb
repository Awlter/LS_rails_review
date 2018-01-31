class QueueItem < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  def video_title
    video.title
  end

  def video_category
    video.category.name
  end

  def rating
    video.reviews.first.rating
  end
end