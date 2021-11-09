require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:hazards) }
    it {should have_many(:user_votes)}
    it {should have_many(:votes).through(:user_votes)}
  end
end
