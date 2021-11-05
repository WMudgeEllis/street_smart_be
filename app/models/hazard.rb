class Hazard < ApplicationRecord
  belongs_to :user
  has_one :vote

  attr_accessor :vote_data

  validates_presence_of :title, :description, :category, :latitude, :longitude, :user_id

  enum category: [:inanimate, :animate]
end
