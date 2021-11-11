class Vote < ApplicationRecord
  belongs_to :hazard
  has_many :user_votes, dependent: :destroy
  has_many :users, through: :user_votes
end
