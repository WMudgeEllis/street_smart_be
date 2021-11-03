class Api::V1::HazardSerializer < ActiveModel::Serializer
  has_one :vote, serializer: Api::V1::VoteSerializer
  belongs_to :user

  attributes :id, :title, :description, :longitude, :latitude, :category
end
