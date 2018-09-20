class Genre  < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, ' ')
  end

  def self.find_by_slug(name)
    Genre.all.find do |genre|
      genre.slug == name
    end
  end


end
