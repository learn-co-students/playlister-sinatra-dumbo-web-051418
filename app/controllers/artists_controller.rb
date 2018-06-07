require 'pry'

class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:slug' do
    artist_slug=params[:slug]
    @artist = Artist.find_by_slug(artist_slug)
    @song_artist = Song.all.select do |song|
      song.artist_id.to_i == @artist.id
    end
    erb :"artists/show"
  end
end
