FactoryBot.define do
  factory :vote do
    upvote { Faker::Number.between(1..100) }
    downvote { Faker::Number.between(1..100) }
  end
end
