require 'pry'

class GenreController < ApplicationController

  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    # binding.pry
    erb :"Genres/show"
  end


end