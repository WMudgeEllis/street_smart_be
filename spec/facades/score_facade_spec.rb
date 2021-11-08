require 'rails_helper'

RSpec.describe ScoreFacade do
  describe 'class methods' do
    it '#walk_safety_info', :vcr do
      attrs = {
        latitude: 47.6085,
        longitude: -122.3295,
        address: '1119%8th%20Avenue%20Seattle%20WA%2098101',
      }
      expect(ScoreFacade.walk_safety_info(attrs)).to be_a(Score)
    end
  end
end
