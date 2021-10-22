class MoatClient
  def initialize(base_uri: 'https://moat.ai/api/task/',
                 headers: { 'Basic': 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==' },
                 params: nil,
                 query_params: '?artist_id=')
    @base_uri = base_uri
    @headers = headers
    @params = params
    @query_params = query_params
  end

  def all_artists
    response = HTTParty.get(@base_uri, headers: @headers)
    response.success? ? ArtistsManager::BuildArtistsList.call(response) : []
  end

  def find_artist(artist_id)
    find_artist_uri = @base_uri + @query_params + artist_id.to_s
    response = HTTParty.get(find_artist_uri, headers: @headers)
    if response.success?
      ArtistsManager::FindArtist.call(response)
    else
      raise StandardError, 'Nothing found with the provided artist_id not_found:404. Make sure that the provided key does exists.'
    end
  end
end
