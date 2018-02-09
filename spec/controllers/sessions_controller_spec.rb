require 'spec_helper'

describe SessionsController do
  describe "#create" do
    context "with valid user info" do
      let(:user) { create(:user) }
      before { post :create, email: user.email, password: user.password }

      it "sets the session[:user_id]" do
        expect(session[:user_id]).to be_present
      end

      it "redirects to home path" do 
        expect(response).to redirect_to home_path
      end
    end

    context "with invalid user info" do
      it "sets flash danger message" do
        post :create
        expect(flash[:danger]).to be_present
      end
    end
  end
end
