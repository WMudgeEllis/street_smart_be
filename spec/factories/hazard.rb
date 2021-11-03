FactoryBot.define do
  factory :hazard do
    title { Faker::Company.name }
    description { Faker::Company.buzzword }
    category { Faker::Marketing.buzzword }
    longitude { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    latitude { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    belongs_to :user
    has_one :hazard
  end
end
