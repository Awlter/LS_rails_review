FactoryBot.define do
  factory :review do
    user
    video
    content { Faker::Lorem.paragraph(3) }
    rating { rand(1..5) }
  end
end
