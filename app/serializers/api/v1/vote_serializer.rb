class Api::V1::VoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :upvote, :downvote
end
