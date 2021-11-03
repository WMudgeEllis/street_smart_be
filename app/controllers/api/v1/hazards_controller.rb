class Api::V1::HazardsController < ApplicationController
  def index
    hazards = Hazard.all
    render json: hazards, each_serializer: Api::V1::HazardSerializer, include: :vote
  end
end
