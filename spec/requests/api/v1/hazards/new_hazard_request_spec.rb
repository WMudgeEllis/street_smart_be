require 'rails_helper'

describe 'New Hazard Request', type: :request do
  describe 'Post /api/v1/hazards' do
    before :each do
      @user1 = create(:user)
      @body_data = {hazard: {
        title: "bird",
        description: "swallow",
        category: 'animate',
        longitude: "-45.4575",
        latitude: "67.8980"
      }, user_email: "#{@user1.email}"}
      @shit_body_data = {hazard: {
        title: "",
        description: "",
        category: 'animate',
        longitude: "-45.4575",
        latitude: ""
      }, user_email: "#{@user1.email}"}
    end

    it 'returns in this json structure' do
      post '/api/v1/hazards', params: @body_data

      response_body = JSON.parse(response.body, symbolize_names: true)
      hazard = response_body[:data]

      expect(hazard[:id].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:title].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:description].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:category].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:longitude]).to be_a(Float)
      expect(hazard[:attributes][:latitude]).to be_a(Float)
      expect(hazard[:attributes][:user_email].scan('/\./').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:upvote].scan('/\D/').empty?).to eq(true)
      expect(hazard[:attributes][:vote_data][:downvote].scan('/\D/').empty?).to eq(true)
    end

    it 'can return a 404 if null fields' do
      post '/api/v1/hazards', params: @shit_body_data
      expect(response).to_not be_successful
    end
  end
end
