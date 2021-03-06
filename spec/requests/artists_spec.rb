require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/artists/index'
      expect(response).to have_http_status(:found)
    end
  end
end
