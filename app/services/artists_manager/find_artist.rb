module ArtistsManager
  class FindArtist < ApplicationService
    attr_reader :response, :artist

    def initialize(response)
      @artist = nil
      @response = response
    end

    def call
      json_response = JSON.parse(response.body, symbolize_names: true)
      artist_id = json_response[0][:id]
      artist_name = json_response[0][:name]
      artist_twitter = json_response[0][:twitter]
      @artist = Artist.new(id: artist_id, name: artist_name, twitter: artist_twitter)
    end
  end
end
