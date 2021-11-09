class User < ApplicationRecord
  has_many :hazards
  has_many :user_votes
  has_many :votes, through: :user_votes
end
