class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email
end
