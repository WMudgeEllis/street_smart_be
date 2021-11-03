require 'rails_helper'

describe 'Hazards Requests', type: :request do
  describe 'GET /api/v1/hazards' do
    let!(:hazards) { create_list :hazards, 20 }
    let(:json) { JSON.parse(response.body, symbolize_names: true) }
    let(:data) { json[:data] }
    let(:attrs) { json[:data].first[:attributes] }
  end
end
