require 'rails_helper'

describe 'Hazard Requests', type: :request do
  describe 'GET /api/v1/hazards/:id' do
    before :each do
      @user1 = create(:user)
      @hazard1 = create(:hazard, user: @user1)
      create(:vote, hazard: @hazard1)
    end

    it 'returns hazard based on id' do
      get "/api/v1/hazards/#{@hazard1.id}"

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      hazard = response_body[:data]
      expect(hazard[:id].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:title].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:description].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:category].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:longitude].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:latitude].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:user_id].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:upvote].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:downvote].scan('/\D/').empty?).to eq(true)
      expect(response_body.length).to eq(1)
    end

    it 'returns 404 if the id is invalid' do
      get "/api/v1/hazards/1"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
