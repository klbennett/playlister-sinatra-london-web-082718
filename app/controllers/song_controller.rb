require 'pry'

class SongController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  # create  a new song

  get "/songs/new" do
    erb :"songs/new"
  end

    #  reading a particular song
  get "/songs/:slug" do
    @song = Song.find_by(slug: params[:slug])
    # binding.pry
    # params.inspect
    erb :"songs/show"
  end

  post "/songs" do
    song = Song.create(params["song"])
    redirect to "/songs"
  end


end
