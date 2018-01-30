class QueueItemsController < ApplicationController
  before_action :require_login

  def index
    @queue_items = QueueItem.includes(:video).order(:position).where(user: current_user)
  end

  def create
    video = Video.find(params[:video_id])
    queue_item = current_user.queue_items.find_by(video: video)

    if queue_item
      flash[:danger] = "This video has already added to the queue."
      redirect_to video_path(video)
    else
      flash[:success] = "This video is added to the queue successfully."
      new_position = QueueItem.where(user: current_user).count + 1
      current_user.queue_items.create(video: video, position: new_position)
      redirect_to video_path(video)
    end
  end
end
