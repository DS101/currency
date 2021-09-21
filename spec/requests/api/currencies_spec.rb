require 'rails_helper'

RSpec.describe 'Api::Currencies', type: :request do
  let!(:usd) { create(:currency) }
  let!(:euro) { create(:currency, name: 'Euro', code: 'EUR', value: '85,000') }

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/currencies'
      expect(response).to have_http_status(:success)
    end

    it 'returns currencies' do
      get '/api/currencies'

      result = JSON.parse(response.body).deep_symbolize_keys
      expect(result[:currencies]).to match([
        {name: 'Euro', code: 'EUR', value: '85,000', id: an_instance_of(Integer)},
        {name: 'US Dollar', code: 'USD', value: '75,000', id: an_instance_of(Integer)}
      ])
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/currencies/USD'
      expect(response).to have_http_status(:success)
    end
  end
end
