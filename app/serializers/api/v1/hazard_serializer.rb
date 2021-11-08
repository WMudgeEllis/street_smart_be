class Api::V1::HazardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description, :longitude, :latitude, :category, :vote_data

  attribute :user_email do |object|
    "#{object.user.email}"
  end
end
