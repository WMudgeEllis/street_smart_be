class Api::V1::ScoreSerializer
  include FastJsonapi::ObjectSerializer

  attributes :score, :description

end
