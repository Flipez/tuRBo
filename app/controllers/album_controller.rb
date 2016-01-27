class AlbumController < ApplicationController

  def create
    p album_params
    @album = Album.new(album_params)
    p @album
    @album.save
  end

private

  def album_params
    params.require(:album).permit(:name, {pictures: []})
  end

end
