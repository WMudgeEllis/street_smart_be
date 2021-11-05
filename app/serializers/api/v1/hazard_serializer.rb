class Api::V1::HazardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description, :longitude, :latitude, :category, :vote_data

  attribute :user_id do |object|
    "#{object.user.id}"
  end
end
