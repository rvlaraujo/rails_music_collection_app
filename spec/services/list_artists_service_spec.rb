require 'rails_helper'

RSpec.describe 'ArtistsManager::ListArtistsService' do
  describe '#call' do
    it 'success access endpoint' do
      artists = ArtistsManager::ListArtistsService.call
      expect(artists.size).to be > 0
    end
  end
end
