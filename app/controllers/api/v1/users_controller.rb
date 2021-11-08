class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      user_json = Api::V1::UserSerializer.new(user).serialized_json
      render json: user_json, status: 201
    else
      render json: 404, status: 404
    end
  end

  private

  def user_params
    { email: params[:user_email] }
  end
end
