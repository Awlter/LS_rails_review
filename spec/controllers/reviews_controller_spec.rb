require 'spec_helper'

describe ReviewsController do
  describe "#create" do
    context "with authenticated user" do
      before { set_current_user }

      it "creates a new review" do
        video = create(:video)
        post :create, review: attributes_for(:review), video_id: video.id
        expect(Review.first.video).to eq(video)
      end
    end
  end
end
