class ArtistsController < ApplicationController
  def index
    @artists = ArtistsManager::ListArtistsService.call()
  end
end
