FactoryBot.define do
  factory :user do
    created_at { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    updated_at { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    # has_many { :hazards }
  end
end
