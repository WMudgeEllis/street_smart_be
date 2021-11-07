require 'rails_helper'

RSpec.describe 'Walk score request' do
  it 'returns the walk score', :vcr do
    get '/api/v1/walkscore', params: { ip: '71.196.130.162' }
  end
end
