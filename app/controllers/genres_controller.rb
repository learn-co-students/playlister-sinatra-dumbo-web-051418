class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    genre_slug=params[:slug]
    name=Artist.all.select do |genre|
      genre.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')==(genre_slug)
    end
    @name = name.last
    @song_genre = Song.all.select do |song|
      song.genre_id.to_i == @name.id
    end

    erb :"genres/show"
  end
end
