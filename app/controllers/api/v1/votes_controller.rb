class Api::V1::VotesController < ApplicationController
  def update
    vote = Vote.find(params[:id])
    user = User.find_by(email: params[:user_email])

    user_vote = UserVote.find_by(user_id:user.id, vote_id: vote.id)
    if user_vote.nil?
      vote.update(vote_params)
      UserVote.create(user_id: user.id, vote_id: vote.id)
      render json: 200, status: 204
    elsif !user_vote.nil?
      render json: 404, status: 404
    else
    end
  rescue ActiveRecord::RecordNotFound
    render json: 404, status: 404
  end

  private

  def vote_params
    params.permit(:upvote, :downvote)
  end
end
