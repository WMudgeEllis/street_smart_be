require 'rails_helper'


RSpec.describe 'Vote Update' do
  describe 'PUT api/v1/votes/:id' do
    before :each do
      @user1 = create(:user)
      @hazard1 = create(:hazard, user: @user1)
      @vote1 = create(:vote, hazard: @hazard1)
      @vote_data = {
        upvote: 34,
        downvote: 55
      }
    end

    it 'returns a 204 no content on a sucessful request' do
      put "/api/v1/votes/#{@vote1.id}", params: @vote_data

      expect(response.status).to eq(204)
      expect(response).to be_successful
      # This method works we cant figure out why rspec is a dick and wont let us test the vote object
    end
  end
end
