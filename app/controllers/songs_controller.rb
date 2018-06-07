class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/:slug' do
    song_slug=params[:slug]
    @song = Song.find_by_slug(song_slug)
    @song_artist = Artist.all.find do |artist|

      artist.id.to_i == @song.artist_id.to_i
    end
    erb :"songs/show"
  end

end
