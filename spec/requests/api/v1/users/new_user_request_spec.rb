require 'rails_helper'

describe 'New User Request', type: :request do
  describe 'Post /api/v1/users' do
    before :each do
      @body_data = {
        user_email: 'doggy@gmail.com'
      }
    end

    it 'returns in this json structure' do
      post '/api/v1/users', params: @body_data

      response_body = JSON.parse(response.body, symbolize_names: true)
      user = response_body[:data]

      expect(user[:attributes][:email].scan('/\./').empty?).to eq(true)
    end

    it 'can return a 404 if null fields' do
      post '/api/v1/hazards', params: @shit_body_data
      expect(response).to_not be_successful
    end
  end
end
