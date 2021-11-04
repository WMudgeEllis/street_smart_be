class Api::V1::VoteSerializer < ActiveModel::Serializer
  attributes :id, :upvote, :downvote
end
