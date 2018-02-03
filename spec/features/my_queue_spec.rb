require 'spec_helper'

feature "Interacting with queue items" do
  scenario "Use add videos to queue and reorder them" do
    comedy = create(:category, name: 'Comedy')
    monk = create(:video, title: 'Monk', category: comedy)
    south_park = create(:video, title: 'South Park', category: comedy)
    futurama = create(:video, title: 'Futurama', category: comedy)

    sign_in

    add_video_to_queue(monk)
    add_video_to_queue(south_park)
    add_video_to_queue(futurama)

    visit queue_items_path

    set_video_position(monk, 3)
    set_video_position(south_park, 1)
    set_video_position(futurama, 2)

    click_button "Update Instant Queue"

    expect_video_position(monk, 3)
    expect_video_position(south_park, 1)
    expect_video_position(futurama, 2)
  end
end

def expect_video_position(video, position)
  expect(find("input[data-video-id='#{video.id}']").value).to eq position.to_s
end

def add_video_to_queue(video)
  visit home_path
  find("a[href='/videos/#{video.id}']").click
  click_link "+ My Queue"
  expect(page).to have_content("This video is added to the queue successfully.")
end

def set_video_position(video, position)
  find("input[data-video-id='#{video.id}']").set(position)
end