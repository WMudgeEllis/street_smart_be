FactoryBot.define do
  factory :vote do
    upvote { Faker::Number.between(1..100) }
    downvote { Faker::Number.between(1..100) }
    belongs_to :hazard
  end
end
