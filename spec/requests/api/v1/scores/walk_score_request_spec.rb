require 'rails_helper'

RSpec.describe 'Walk score request' do
  it 'returns the walk score', :vcr do
    get '/api/v1/walkscore', params: { ip: '69.132.37.48' }

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    score_info = response_body[:data][:attributes]
    expect(score_info[:score]).to eq(19)
    expect(score_info[:description]).to eq("Car-Dependent")
  end
end
