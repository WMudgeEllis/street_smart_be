class Api::V1::ScoreController < ApplicationController
  # before_action :

  def index
    ScoreFacade.walk_safety_info(attrs)
  end


  private
  def attrs
    require "pry"; binding.pry
    location = Geokit::Geocoders::IpGeocoder.geocode('12.215.42.19')
  end
end
