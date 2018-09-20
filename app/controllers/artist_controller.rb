require 'pry'

class ArtistController < ApplicationController


  get "/artists" do
    @artists = Artist.all
    erb :"artists/index"
  end


  get "/artists/:slug" do
    @artist = Artist.find_by_slug(params[:slug])
    # binding.pry
    erb :"Artists/show"
  end



  # placeholder for new method

  # get "/songs/:slug" do
  #   @song = Artist.find_by_slug(params[:slug])
  #   # binding.pry
  #   # params.inspect
  #   erb :"songs/show"
  # end




end
