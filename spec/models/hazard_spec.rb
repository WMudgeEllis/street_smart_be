require 'rails_helper'

RSpec.describe Hazard do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_one(:vote) }
  end

  describe 'class methods' do
    describe '#nearest_hazards(current_location, limit)' do
      @user1 = create(:user)
      @user2 = create(:user)
      @user1_hazards = create_list(10, :hazard, user: @user1)
      @user2_hazards = create_list(10, :hazard, user: @user2)
      @current_location = [39.5296,119.8138]

      expect()
    end
  end
end
