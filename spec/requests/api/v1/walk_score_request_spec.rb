require 'rails_helper'

RSpec.describe 'Walk score request' do
  it 'returns the walk score' do
    get '/api/v1/walkscore'

  end
end
