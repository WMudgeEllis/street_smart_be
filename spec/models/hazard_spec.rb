require 'rails_helper'

RSpec.describe Hazard do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_one(:vote) }
  end
end
