require 'spec_helper'

feature "Signing in" do
  background do
    create(:user, email: "walter@example.com", password: "password", full_name: "Walter Wang")
  end

  scenario "Signing in with correct credentials" do
    visit root_path
    click_link "Sign In"
    fill_in "Email Address", with: "walter@example.com"
    fill_in "Password", with: "password"
    click_button 'Sign In'
    expect(page).to have_content 'Walter Wang'
  end
end