require 'rails_helper'

RSpec.describe Hazard do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_one(:vote) }
  end

  describe 'class methods' do
    describe '#nearest_hazards(current_location, limit)' do
      before :each do
        @user1 = create(:user)
        @user2 = create(:user)
        @hzrd1 = @user1.hazards.create(title: 'man eating a hotdog', description: 'it had peanut butter on it', category: 'animate', latitude: 39.618818, longitude: -119.765702)
        @hzrd2 = @user2.hazards.create(title: 'man eating a hotdog', description: 'it had peanut butter on it', category: 'animate', latitude: 39.618820, longitude: -119.765721)
        @hzrd3 = @user2.hazards.create(title: 'man eating a hotdog', description: 'it had peanut butter on it', category: 'animate', latitude: 39.618820, longitude: -119.765734)
        @current_location = [39.618818, -119.765702]
      end

      it 'can return within a range' do
        expect(Hazard.nearest_hazards(@current_location, 50)).to eq([@hzrd1, @hzrd2, @hzrd3])
      end
    end
  end
end
