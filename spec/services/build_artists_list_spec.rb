require 'rails_helper'

RSpec.describe 'ArtistsManager::BuildArtistsList' do
  describe '#call' do
    it 'success access endpoint' do
      base_uri = 'https://moat.ai/api/task/'
      headers = { 'Basic': 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==' }
      response = HTTParty.get(base_uri, headers: headers)
      artists = ArtistsManager::BuildArtistsList.call(response)
      expect(artists.first).to be_an_instance_of(Artist)
    end
  end
end
