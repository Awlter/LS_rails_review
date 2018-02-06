require 'spec_helper'

describe UsersController do
  describe "#create" do
    context "with valid input" do
      before { post :create, user: attributes_for(:user) }
      
      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "sets the success message" do
        expect(flash[:success]).to be_present
      end

      it "redirects the sign in path" do
        expect(response).to redirect_to sign_in_path
      end
    end

    context "Action mailer" do
      let(:user_attributes) { attributes_for(:user) }
      after { ActionMailer::Base.deliveries.clear }
      it "sends out an email to the user" do
        post :create, user: user_attributes
        expect(ActionMailer::Base.deliveries.last.to).to eq [user_attributes[:email]]
      end

      it "sends out with user name" do
        post :create, user: user_attributes
        expect(ActionMailer::Base.deliveries.last.body).to include user_attributes[:full_name]
      end

      it "does not send out email with invalid input" do
        user_attributes[:full_name] = nil
        post :create, user: user_attributes
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end

    context "with invalid input" do
      it "sets error message" do
        post :create, user: attributes_for(:user, email: nil)
        expect(flash[:error]).to be_present
      end
    end
  end
end
