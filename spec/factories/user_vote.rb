FactoryBot.define do
  factory :user_vote do
    association :user
    association :vote
  end
end
