FactoryBot.define do
  factory :hazard do
    title { Faker::Company.name }
    description { Faker::Company.buzzword }
    category { 1 }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
