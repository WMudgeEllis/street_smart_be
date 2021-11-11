class Api::V1::HazardsController < ApplicationController
  def index
    hazards = Hazard.nearest_hazards(ip_to_coords)
    hazards.each do |hazard|
      hazard.vote_data = { upvote: hazard.vote.upvote.to_s, downvote: hazard.vote.downvote.to_s }
    end
    hazards = Api::V1::HazardSerializer.new(hazards).serialized_json
    render json: hazards
  end

  def show
    hazard = Hazard.find(params[:id])
    hazard.vote_data = { upvote: hazard.vote.upvote.to_s, downvote: hazard.vote.downvote.to_s }
    hazard = Api::V1::HazardSerializer.new(hazard)
    render json: hazard
  rescue ActiveRecord::RecordNotFound
    render json: 404, status: 404
  end

  def create
    user = User.find_by(email: user_params[:user_email])
    hazard = user.hazards.new(hazard_params)

    if hazard.save
      vote = Vote.create(hazard_id: hazard.id, upvote: 0, downvote: 0)
      hazard.vote_data = { upvote: vote.upvote.to_s, downvote: vote.downvote.to_s }

      hazard = Api::V1::HazardSerializer.new(hazard).serializable_hash
      render json: hazard
    else
      render json: 404, status: 404
    end
  end

  def destroy
    hazard = Hazard.find(params[:id])
    hazard.destroy

  rescue ActiveRecord::RecordNotFound
    render json: 404, status: 404
  end

  private

  def hazard_params
    params.permit(:title, :description, :category, :latitude, :longitude)
  end

  def user_params
    params.permit(:user_email)
  end

  def ip_to_coords
    location = Geocoder.search(params[:ip])
    location = location.first.data["loc"]
    location = location.split(',')
    location.map { |coord| coord.to_f }
  end

end
