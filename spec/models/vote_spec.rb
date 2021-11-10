require 'rails_helper'

RSpec.describe Vote do
  describe 'relationships' do
    it { should belong_to(:hazard) }
    it {should have_many(:user_votes)}
    it {should have_many(:users).through(:user_votes)}
  end
end
