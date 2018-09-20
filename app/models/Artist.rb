require 'pry'

class Artist  <ActiveRecord::Base

  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, ' ')
  end

  def self.find_by_slug(name)
    Artist.all.find do |artist|
      artist.slug == name
    end
  end
    # slug.find_by do |slug_names|
    #     slug_names.name == name


end
#
#
# [2] pry(main)> Artist.new(name:"Katy")
# => #<Artist:0x007fb37a1978e8 id: nil, name: "Katy">
# [3] pry(main)> Artist.new(name:"Katy").save
# => true
# [4] pry(main)> Artist.all
# => [#<Artist:0x007fb37990cef8 id: 1, name: "Katy">]
# [5] pry(main)> Artist.create(name:"Drake")
# => #<Artist:0x007fb37a8dda08 id: 2, name: "Drake">
# [6] pry(main)> Artist.create(name:"Cher")
# => #<Artist:0x007fb37b40df90 id: 3, name: "Cher">
# [7] pry(main)> Song.create(name: "Dark Horse", artist_id : 1)
# SyntaxError: unexpected ':', expecting =>
# Song.create(name: "Dark Horse", artist_id : 1)
#                                            ^
# [7] pry(main)> Song.create(name: "Dark Horse", artist_id: 1)
# => #<Song:0x007fb37b2f6cd8 id: 1, name: "Dark Horse", artist_id: 1>
# [8] pry(main)> Song.create(name: "Fireworks", artist_id: 1)
# => #<Song:0x007fb37a4632e8 id: 2, name: "Fireworks", artist_id: 1>
# [9] pry(main)> Song.create(name: "ET", artist_id: 1)
# => #<Song:0x007fb37986c1d8 id: 3, name: "ET", artist_id: 1>
# [10] pry(main)> Song.create(name: "Hotline Bling", artist_id: 2)
# => #<Song:0x007fb37a1f67a8 id: 4, name: "Hotline Bling", artist_id: 2>
# [11] pry(main)> Song.create(name: "Nonstop", artist_id: 2)
# => #<Song:0x007fb37a0f75a0 id: 5, name: "Nonstop", artist_id: 2>
# [12] pry(main)> Song.create(name: "Believe", artist_id: 3)
# => #<Song:0x007fb37b0e7e60 id: 6, name: "Believe", artist_id: 3>
# [13] pry(main)> Genre.create(name: "pop")
# => #<Genre:0x007fb37a3d3c10 id: 1, name: "pop">
# [14] pry(main)> Genre.create(name: "hip-hop")
# => #<Genre:0x007fb37b25e9b0 id: 2, name: "hip-hop">
# [15] pry(main)> Genre.create(name: "rap")
# => #<Genre:0x007fb37a89f618 id: 3, name: "rap">
# [16] pry(main)> Genre.create(name: "rock")
# => #<Genre:0x007fb37b39d538 id: 4, name: "rock">
# [17] pry(main)> Genre.all
# => [#<Genre:0x007fb37b4975b0 id: 1, name: "pop">,
#  #<Genre:0x007fb37b497420 id: 2, name: "hip-hop">,
#  #<Genre:0x007fb37b497290 id: 3, name: "rap">,
#  #<Genre:0x007fb37b497150 id: 4, name: "rock">]
# [18] pry(main)> Song.all
# => [#<Song:0x007fb3799775c8 id: 1, name: "Dark Horse", artist_id: 1>,
#  #<Song:0x007fb379977460 id: 2, name: "Fireworks", artist_id: 1>,
#  #<Song:0x007fb379977280 id: 3, name: "ET", artist_id: 1>,
#  #<Song:0x007fb379977118 id: 4, name: "Hotline Bling", artist_id: 2>,
#  #<Song:0x007fb379976fd8 id: 5, name: "Nonstop", artist_id: 2>,
#  #<Song:0x007fb379976da8 id: 6, name: "Believe", artist_id: 3>]
# [19] pry(main)> SongGenre.create(song_id: 1, genre_id: 1)
#
#
# SongGenre.create(song_id: 5, genre_id: 3)
# => #<SongGenre:0x007f9b32bcf0f0 id: 2, song_id: 5, genre_id: 3>
# [6] pry(main)> SongGenre.create(song_id: 4, genre_id: 2)
# => #<SongGenre:0x007f9b31173940 id: 3, song_id: 4, genre_id: 2>
# [7] pry(main)> SongGenre.create(song_id: 4, genre_id: 3)
# => #<SongGenre:0x007f9b31b2ae20 id: 4, song_id: 4, genre_id: 3>
# [8] pry(main)> SongGenre.all
# => [#<SongGenre:0x007f9b32a40c98 id: 1, song_id: 1, genre_id: 1>,
#  #<SongGenre:0x007f9b32a409c8 id: 2, song_id: 5, genre_id: 3>,
#  #<SongGenre:0x007f9b32a40798 id: 3, song_id: 4, genre_id: 2>,
#  #<SongGenre:0x007f9b32a40450 id: 4, song_id: 4, genre_id: 3>]
# [9] pry(main)> SongGenre.create(song_id: 2, genre_id: 1)
# => #<SongGenre:0x007f9b318b8638 id: 5, song_id: 2, genre_id: 1>
# [10] pry(main)> SongGenre.create(song_id: 3, genre_id: 1)
# => #<SongGenre:0x007f9b3197d050 id: 6, song_id: 3, genre_id: 1>
# [11] pry(main)> SongGenre.create(song_id: 6, genre_id: 1)
# => #<SongGenre:0x007f9b329d8350 id: 7, song_id: 6, genre_id: 1>
