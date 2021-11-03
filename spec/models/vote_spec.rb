require 'rails_helper'

RSpec.describe Vote do
  describe 'relationships' do
    it { should belong_to(:hazard) }
  end
end
