require 'rails_helper'

RSpec.describe 'walk score service' do
  describe 'class methods' do
    it '#walk_score_by_location', :vcr do
      attrs = {
        latitude: '47.6085',
        longitude: '-122.3295',
        address: '1119%8th%20Avenue%20Seattle%20WA%209810'
      }

      result = WalkScoreService.walk_score_by_location(attrs)
      expect(result[:walkscore]).to be_a(Numeric)
      expect(result[:description]).to be_a(String)
    end
  end
end
