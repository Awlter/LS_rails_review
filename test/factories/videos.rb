FactoryBot.define do
  factory :video do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    category    
  end
end
