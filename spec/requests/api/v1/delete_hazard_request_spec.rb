require 'rails_helper'

describe 'Hazard Requests', type: :request do
  describe 'DELETE /api/v1/hazards/:id' do
    before :each do
      @user1 = create(:user)
      @hazard1 = create(:hazard, user: @user1)
      create(:vote, hazard: @hazard1)
    end

    it 'sucessfully deletes hazard based on id' do
      delete "/api/v1/hazards/#{@hazard1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
    end

    it 'returns an error if id is invalid' do
      delete "/api/v1/hazards/1"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
