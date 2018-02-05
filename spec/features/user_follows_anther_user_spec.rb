require 'spec_helper'

feature 'User follows another user' do
  scenario "User visit another user's profile page and follow him or her" do
    user_a = create(:user)
    user_b = create(:user)
    video = create(:video)
    create(:review, video: video, user: user_b)
    sign_in(user_a)

    click_video_on_home_page(video)
    click_link user_b.full_name
    click_link 'Follow'
    click_link 'People'
    expect(page).to have_content user_b.full_name

    click_video_on_home_page(video)
    click_link user_b.full_name

    click_link "People"
    find("a[data-method='delete']").click
    expect(page).to_not have_content user_b.full_name
  end
end