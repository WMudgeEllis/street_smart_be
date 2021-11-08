class Api::V1::HazardsController < ApplicationController
  def index
    # current_location = function
    hazards = Hazard.nearest_hazards(current_location)
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
    hazard = Hazard.new(hazard_params)

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
    params.permit(:title, :description, :category, :latitude, :longitude, :user_id)
  end
end
