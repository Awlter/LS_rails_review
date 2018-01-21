require 'spec_helper'

describe Video, :focus do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to belong_to(:category)}
  
  it 'is valid with title, description' do
    video = FactoryGirl.build(:video)
    expect(video.valid?).to be_truthy
  end
end
