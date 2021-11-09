class Api::V1::VotesController < ApplicationController
  def update
    vote = Vote.find(params[:id])
    user = User.find_by(email: params[:email])
    user_vote = UserVote.find_by(user_id:user.id, vote_id: vote.id)
    if user_vote.nil?
      vote.update(vote_params)
      UserVote.create(user_id: user.id, vote_id: vote.id)
      render json: 200, status: 204
    elsif !user_vote.nil?
      render json: 404, status: 404
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
# vote gets updated based on being passed an upvote or a downvote
#votes are tied to hazards
#user votes is to join user id and vote ids may need to add vote data to this?
# want to make sure if a user id is already tied to a vote id
#that they cannot update the vote again
#will want to probably need to create a helper method to see if a vote
#has a user vote that already has a user's id.
#how would the call know if a user has already voted though?
#when a user clicks to up or down vote in the fe that creates a user_vote
#find the vote, then find the hazard, but how do we find the user?
#or make model method to make sure all user votes have a unique user id for vote
#object? then if that is cleared update.

#user email will be passed through from fe-optional or default param?
#from here will try to find uservote object-if one does not exist make one
#then do rest of call
#if it is pre-existing (a user has already voted) then will route to saying
#call cannot be completed

#if uservote is found then
