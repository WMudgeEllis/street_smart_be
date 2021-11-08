require 'rails_helper'

RSpec.describe 'Walk score request' do
  it 'returns the walk score', :vcr do
    get '/api/v1/walkscore', params: { ip: '69.132.37.48' }
  end
end
