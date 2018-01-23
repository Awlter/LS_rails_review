require 'spec_helper'

describe Category do
  it { is_expected.to have_many(:videos).order(created_at: :desc)}
  it { is_expected.to validate_presence_of(:name)}

  describe "#recent_videos" do
    let(:show) { FactoryGirl.create(:category) }
    it "returns an array of videos ordered from the lastest created" do
      video1 = FactoryGirl.create(:video, category: show)
      video2 = FactoryGirl.create(:video, created_at: 1.day.since, category: show)
      video3 = FactoryGirl.create(:video, created_at: 1.day.ago, category: show)

      expect(show.recent_videos).to eq([video2, video1, video3])
    end
    it "returns an array containing 6 videos if there are more than 6 found for that category" do
      8.times { FactoryGirl.create(:video, category: show) }
      expect(show.recent_videos.count).to eq 6
    end
  end
end
