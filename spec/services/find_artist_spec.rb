require 'rails_helper'

RSpec.describe 'ArtistsManager::FindArtist' do
  describe '#call' do
    it 'success access endpoint' do
      base_uri = 'https://moat.ai/api/task/?artist_id=1'
      headers = { 'Basic': 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==' }
      response = HTTParty.get(base_uri, headers: headers)
      artist = ArtistsManager::FindArtist.call(response)
      expect(artist).to be_an_instance_of(Artist)
    end
  end
end
