class ArtistsController < ApplicationController
  before_action :set_moat_client

  def index
    @artists = @client.all_artists
  end

  def show
    @artist = @client.find_artist(params[:id])
    @albums = Album.where({artist_id: @artist.id})
  end

  private

  def set_moat_client
    @client = MoatClient.new
  end
end
