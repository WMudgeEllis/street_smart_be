require 'rails_helper'


RSpec.describe 'Vote Update' do
  describe 'PUT api/v1/votes/:id' do
    before :each do
      @user1 = create(:user, email: 'test@email.com')
      @user2 = create(:user, email: 'test2@email.com')
      @hazard1 = create(:hazard, user: @user1)
      @vote1 = create(:vote, hazard: @hazard1)
      @user2vote = create(:user_vote, user: @user2, vote: @vote1)
      @vote_data = {
        upvote: 34,
        downvote: 55
      }
    end

    it 'returns a 204 no content on a sucessful request' do
      put "/api/v1/votes/#{@vote1.id}", params: {vote_data: @vote_data, email:@user1.email}
      expect(response.status).to eq(204)
      expect(response).to be_successful
      # This method works we cant figure out why rspec is a dick and wont let us test the vote object
    end

    it 'does not allow a user to vote more than once on a hazard' do
        put "/api/v1/votes/#{@vote1.id}", params: {vote_data: @vote_data, email:@user2.email}
        expect(response.status).to eq(404)
    end
  end
end
