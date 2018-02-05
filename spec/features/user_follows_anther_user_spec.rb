require 'spec_helper'

feature 'User follows another user' do
  scenario "User visit another user's profile page and follow him or her" do
    user_a = create(:user)
    user_b = create(:user)
    sign_in(user_a)
    visit user_path(user_b)
    expect(page).to have_content user_b.full_name

    click_link "Follow"
    expect(page).to_not have_content "/\bFollow\b/"
  end
end