class Hazard < ApplicationRecord
  belongs_to :user
  has_one :vote, dependent: :destroy

  attr_accessor :vote_data

  validates_presence_of :title, :description, :category, :latitude, :longitude, :user_id

  acts_as_mappable

  enum category: %i[inanimate animate]


  def self.nearest_hazards(current_location, limit)
    self.within(50, origin: :current_location)
  end
end
