require 'rails_helper'

describe 'New User Request', type: :request do
  describe 'Post /api/v1/users' do
    before :each do
      @body_data = {
        user_email: 'doggy@gmail.com'
      }
      @bad_body_data = {
        user_email: " "
      }
    end

    it 'returns in this json structure' do
      post '/api/v1/users', params: @body_data

      response_body = JSON.parse(response.body, symbolize_names: true)
      user = response_body[:data]

      expect(user[:attributes][:email].scan('/\./').empty?).to eq(true)
    end

    it 'can return a 404 if null fields' do
      post '/api/v1/users', params: @bad_body_data
      expect(response.status).to eq(404)
    end
    it 'can return a 404 if no params passed' do
      post '/api/v1/users'
      expect(response.status).to eq(404)
    end

  end
end
