require 'rails_helper'

describe 'Hazards Requests', type: :request do
  describe 'GET /api/v1/hazards' do
    before :each do
      @user1 = create(:user)
      @hazards = create_list(:hazard, 20, user: @user1)
      @hazards.each do |hazard|
        create(:vote, upvote: 0, downvote: 0, hazard: hazard)
      end
    end

    it 'returns all hazards' do
      get '/api/v1/hazards'

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      hazard = response_body[:data].first
      expect(hazard[:id].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:title].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:description].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:category].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:longitude]).to be_a(Float)
      expect(hazard[:attributes][:latitude]).to be_a(Float)
      expect(hazard[:attributes][:user_id].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:upvote].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:downvote].scan('/\D/').empty?).to eq(true)
      expect(response_body[:data].length).to eq(20)
    end

    # Sad path if Bad tests will change
  end
end
