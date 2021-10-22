module ArtistsManager
  class BuildArtistsList < ApplicationService
    attr_reader :response, :artist_list

    def initialize(response)
      @artist_list = []
      @response = response
    end

    def call
      json_response = JSON.parse(response.body, symbolize_names: true)
      json_response.each do |resp|
        artist_id = resp[0][:id]
        artist_name = resp[0][:name]
        artist_twitter = resp[0][:twitter]
        @artist_list << Artist.new(id: artist_id, name: artist_name, twitter: artist_twitter)
      end
      @artist_list
    end
  end
end
