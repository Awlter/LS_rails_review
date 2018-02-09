require 'spec_helper'

describe VideosController do
  describe "#index" do
    context "as authenticated user" do
      before do
        set_current_user
        get :index
      end

      it "responses successfully" do
        expect(response).to be_success
      end

      it "returns a 200 response" do
        expect(response.status).to eq 200
      end
    end

    context "a guest" do
      before { get :index }
      it "returns a 302 response" do
        expect(response.status).to eq 302
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#show" do
    context "as authenticated user" do
      let(:video) { create(:video) }
      before do
        set_current_user
        get :show, id: video.id
      end

      it "responses successfully" do
        expect(response).to be_success
      end

      it "returns a 200 response" do
        expect(response.status).to eq 200
      end
    end

    context "as unauthenticated user" do
      let(:video) {create(:video)}

      before { get :show, id: video.id }
      
      it "returns a 302 response" do
        expect(response.status).to eq 302
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
