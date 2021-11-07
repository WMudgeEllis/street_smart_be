class Api::V1::ScoreController < ApplicationController
  # before_action :

  def index
    # ScoreFacade.walk_safety_info(attrs)
    attrs
  end


  private
  def attrs
    # require "pry"; binding.pry
    locations = Geocoder.search(params[:ip])
    require "pry"; binding.pry
    coords = locations.first.coordinates
  end
end
