FactoryBot.define do
  factory :queue_item do
    video
    user
    sequence(:position)
  end
end