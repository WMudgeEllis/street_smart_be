class Api::V1::ScoreController < ApplicationController

  def index
    score = ScoreFacade.walk_safety_info(attrs)
  end


  private
  def attrs
    locations = Geocoder.search(params[:ip])
    coords = locations.first.coordinates
    require "pry"; binding.pry
    addresses = Geocoder.search(coords)
    addr_hash = addresses.first.data['address']
    current_address = "#{addr_hash['house_number']}%20#{addr_hash['road']}%20#{addr_hash['city']}%20#{addr_hash['state']}%20#{addr_hash['postcode']}"
    {
      latitude: coords[0],
      longitude: coords[1],
      address: current_address
    }
  end
end
