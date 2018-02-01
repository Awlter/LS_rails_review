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
    video.reviews.find_by(user: user).rating
  end

  def update_position_and_rating(item_hash)
    update!(position: item_hash[:position])
    video.reviews.find_by(user: user).update!(rating: item_hash[:rating])
  end
end