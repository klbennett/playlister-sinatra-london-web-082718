require 'pry'

class SongController < ApplicationController

  get "/songs" do
    @songs = Song.all
    # binding.pry
    erb :"songs/index"
  end

  # create  a new song

  get "/songs/new" do
    @genres = Genre.all #access all genres from create new song page
    erb :"songs/new" #render page
  # binding.pry
  end

    #  reading a particular song
  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug]) #referring to find_by_slug Song class method. Method only requires one argument, the name of the song
    erb :"songs/show"
  end

  post "/songs" do
    # binding.pry
    @song = Song.find_or_create_by(name: params[:song][:name], artist: Artist.find_or_create_by(name: params[:song][:artist]))
    # instantiate a new song with song name and artist params from new.erb, passed as a hash. @song is an object and it's params (name, artist, genre) are objects themselves in a hash structure.  Assigned to variable @song to assign params to particular instance of song_genre
#params taken from new.erb respective name field
# We are finding the object of an artist through it's name property, and passing in the whole Artist object as a parameter.
    @song.genre_ids = params[:genres] #assign genre to @song, from new.erb checkbox name field.
    @song.save #addition of genres needs to be saved to the song instance
    redirect to "/songs/#{@song.slug}" #interpolate slug of new song and redirect

  end


end
