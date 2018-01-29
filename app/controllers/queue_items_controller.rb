class QueueItemsController < ApplicationController
  def index
    @queue_items = QueueItem.includes(:video).where(user: current_user)
  end
end
