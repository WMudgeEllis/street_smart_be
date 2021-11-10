class Api::V1::ScoreController < ApplicationController

  def index
    score = ScoreFacade.walk_safety_info(attrs)
    score_json = Api::V1::ScoreSerializer.new(score).serializable_hash
    render json: score_json, status: 200
  end


  private
  def attrs
    ## This may not be exactly how we recieve IP from the front end,
    ## but it can be refactored to get that info from the right param/method
    locations = Geocoder.search(params[:ip])
    coords = locations.first.coordinates
      {
      latitude: coords[0],
      longitude: coords[1]
    }
  end
end
