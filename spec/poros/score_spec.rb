require 'rails_helper'

RSpec.describe Score do
  before :each do
    attrs = {
      walkscore: 99,
      description: 'Very safe'
    }
    @score1 = Score.new(attrs)
  end

  it 'exists with attributes' do
    expect(@score1.score).to eq(99)
    expect(@score1.description).to eq('Very safe')
    expect(@score1.id.nil?).to be_truthy
  end
end
