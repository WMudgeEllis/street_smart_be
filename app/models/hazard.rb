class Hazard < ApplicationRecord
  belongs_to :user
  has_one :vote, dependent: :delete_all

  attr_accessor :vote_data

  validates_presence_of :title, :description, :category, :latitude, :longitude, :user_id

  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  enum category: %i[inanimate animate]

  def self.nearest_hazards(current_location, area = 50)
    Hazard.within(area, origin: current_location).all
  end

end
