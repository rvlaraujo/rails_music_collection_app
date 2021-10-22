require 'rails_helper'

RSpec.describe 'MoatClient' do
  before :each do
    @client = MoatClient.new
    @client_failed = MoatClient.new(base_uri: 'https://an_invalid_uri')
  end

  context 'MoatClient#all_artists' do
    it 'Retriving Artist List from Artits EndPoint' do
      artists_list = @client.all_artists
      expect(artists_list.first).to be_an_instance_of(Artist)
    end

    it 'Error when retriving Artist List from Artits EndPoint' do
      expect { @client_failed.all_artists }.to raise_error(SocketError)
    end
  end

  context 'MoatClient#find_artist' do
    it 'Retriving an Artist by Id from Artits EndPoint' do
      artist = @client.find_artist(1)
      expect(artist).to be_an_instance_of(Artist)
    end

    it 'Try find Artist with non existence Id from Artits EndPoint' do
      non_existing_user_id = 100
      expect { @client.find_artist(non_existing_user_id) }.to raise_error(StandardError)
    end

    it 'Error when Retriving an Artist by Id from Artits EndPoint' do
      expect { @client_failed.find_artist(1) }.to raise_error(SocketError)
    end
  end
end
