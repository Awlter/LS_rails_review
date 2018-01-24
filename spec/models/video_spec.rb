require 'spec_helper'

describe Video do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to belong_to(:category)}
  
  it 'is valid with title, description' do
    video = build(:video)
    expect(video.valid?).to be_truthy
  end

  describe ".search_by_title" do
    let(:futurama) { create(:video, title: "Futurama") }
    let(:futurama1) { create(:video, title: "Futurama1", created_at: 1.day.ago)}
    before do
      futurama
    end

    it "returns an empty array if there is no match" do
      expect(Video.search_by_title('hello')).to eq([])
    end

    it "returns an empty array if title is an empry string" do
      expect(Video.search_by_title('')).to eq([])
    end
    it "returns an array of one video with an exact match" do
      expect(Video.search_by_title('Futurama')).to eq([futurama])
    end
    it "returns an array of one video with a partial match" do
      expect(Video.search_by_title('tura')).to eq([futurama])
    end
    it "returns an array of matched videos ordered by created_at" do
      futurama1
      expect(Video.search_by_title('Futurama')).to eq([futurama1, futurama])
    end
  end
end
