require 'spec_helper'

feature 'Invite another user' do
  scenario "User successfully invites another user to register and sign in" do
    inviter = create(:user)
    the_invited = attributes_for(:user)

    sign_in(inviter)
    click_link "Invite Friends"

    fill_in "Friend's Name", with: the_invited[:full_name]
    fill_in "Friend's Email Address", with: the_invited[:email]
    click_button "Send Invitation"

    open_email the_invited[:email]
    current_email.click_link "Join Myflix"
    expect(find_field('Email Address').value).to eq the_invited[:email]
    fill_in "Password", with: the_invited[:password]
    click_button "Submit"

    sign_out
    sign_in(the_invited)

    click_link "People"
    expect(page).to have_content inviter.full_name
  end
end