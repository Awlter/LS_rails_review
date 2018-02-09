require 'spec_helper'

describe QueueItemsController do
  describe "#index" do
    it 'redirect to root path if user is not logged in' do
      get :index
      expect(response).to redirect_to root_path
    end

    it 'orders items based on position' do
    end
  end

  describe "#create" do
    context "with the queue item not yet existed" do
      it "add a new queue item" do
        set_current_user
        video = create(:video)
        post :create, video_id: video.id
        expect(QueueItem.count).to eq 1
      end
    end

    context "with the queue item existed" do
      it "doesn't create a queue item" do
        user = create(:user)
        set_current_user(user)
        video = create(:video)
        create(:queue_item, video: video, user: user)
        post :create, video_id: video.id
        expect(QueueItem.count).to eq 1
      end
    end
  end
end
