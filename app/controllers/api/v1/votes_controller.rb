class Api::V1::VotesController < ApplicationController
  def update
    vote = Vote.find(params[:id])
    require "pry"; binding.pry
    if vote.update(vote_params)
      render json: 200, status: 204
    else
      render json: 404, status: 404
    end
  rescue ActiveRecord::RecordNotFound
    render json: 404, status: 404
  end

  private

  def vote_params
    params.permit(:upvote, :downvote)
  end
end
