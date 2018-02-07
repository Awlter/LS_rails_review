require 'spec_helper'

feature 'User resets passwords' do
  scenario "User successfully resets her password" do
    user = create(:user)
    visit root_path

    click_link "Sign In"
    click_link "Forget Password?"

    fill_in "Email Address", with: user.email
    click_button "Send Email"

    open_email user.email
    current_email.click_link "Reset Password"

    fill_in "Password", with: 'new_password'
    click_button "Reset Password"
    
    fill_in "Email Address", with: user.email
    fill_in "Password", with: "new_password"
    expect(page).to have_content "You have reset your password successfully."
  end
end