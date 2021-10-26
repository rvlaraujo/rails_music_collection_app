module ApplicationHelper
  def artist_name(artist_id)
    client = MoatClient.new
    client.find_artist(artist_id).name
  end
end
