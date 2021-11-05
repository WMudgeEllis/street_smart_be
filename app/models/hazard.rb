class Hazard < ApplicationRecord
  belongs_to :user
  has_one :vote, dependent: :destroy

  attr_accessor :vote_data

  validates_presence_of :title, :description, :category, :latitude, :longitude, :user_id

  enum category: %i[inanimate animate]
end
