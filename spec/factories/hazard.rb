FactoryBot.define do
  factory :hazard do
    title { Faker::Company.name }
    description { Faker::Company.buzzword }
    category { 1 }
    longitude { Faker::Number.decimal(l_digits: 2, r_digits: 4) }
    latitude { Faker::Number.decimal(l_digits: 2, r_digits: 4) }
  end
end
