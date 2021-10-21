module ArtistsManager
  class ListArtistsService < ApplicationService
    # returns the list of artists like an json hash
    def call
      artists_list = []
      endpoit = 'https://moat.ai/api/task/'
      headers = { 'Basic': 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==' }
      response = HTTParty.get(endpoit, headers: headers)
      if response.success?
        json_response = JSON.parse(response.body, symbolize_names: true)
        json_response.each do |resp|
          artists_list << Artist.new(resp)
        end
      end
      artists_list
    end
  end
end
