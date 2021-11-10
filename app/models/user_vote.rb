class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :vote 
end
