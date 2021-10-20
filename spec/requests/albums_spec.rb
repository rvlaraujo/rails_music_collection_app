require 'rails_helper'

RSpec.describe '/albums', type: :request do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:regular_user) { FactoryBot.create(:user, :user) }
  let(:album) { FactoryBot.create(:album) }

  before :each do
    @headers = { 'ACCEPT' => 'application/json' }
  end

  describe 'DELETE /destroy' do
    it 'Admin users can delete albuns' do
      login_as(admin_user, scope: :user)
      delete "/albums/#{album.id}", headers: @headers
      expect(response).to have_http_status(:no_content)
    end

    it 'Regular uses cannot delete albuns' do
      login_as(regular_user, scope: :user)
      delete "/albums/#{album.id}", headers: @headers
      expect(response).to have_http_status(:unauthorized)
    end
  end

  after :each do
    Album.delete_all
  end
end
