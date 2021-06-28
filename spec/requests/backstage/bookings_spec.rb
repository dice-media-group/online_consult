require 'rails_helper'

RSpec.describe 'Backstage::Bookings', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/backstage/bookings'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/backstage/bookings/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    xit 'returns http success' do
      get '/backstage/bookings/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
