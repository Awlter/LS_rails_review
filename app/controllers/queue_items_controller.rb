class QueueItemsController < ApplicationController
  before_action :require_login

  def index
    @queue_items = current_user.queue_items.includes(:video)
  end

  def create
    video = Video.find(params[:video_id])
    create_queue_item(video)

    redirect_to video_path(video)
  end

  def destroy
    queue_item = QueueItem.find(params[:id])
    if queue_item.user == current_user
      flash[:warning] = 'You have deleted one queue item.'
      queue_item.delete
    else
      flash[:danger] = 'You are not allowed to do that.'
    end
    
    redirect_to queue_items_path
  end

  def update_queue
    binding.pry
  end

  private

  def create_queue_item(video)
    exsited_item = current_user.queue_items.find_by(video: video)

    if exsited_item
      flash[:danger] = "This video has already added to the queue."
    else
      flash[:success] = "This video is added to the queue successfully."
      new_position = QueueItem.where(user: current_user).count + 1
      current_user.queue_items.create(video: video, position: new_position)
    end
  end
end
