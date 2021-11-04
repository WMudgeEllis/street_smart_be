class Hazard < ApplicationRecord
  belongs_to :user
  has_one :vote
end
