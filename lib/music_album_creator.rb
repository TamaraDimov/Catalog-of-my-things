require_relative 'music_album'
require_relative 'genre'

class MusicAlbumCreator
  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
  end

  def create_album
    publish_date = read_music_published_date_from_user_input
    title = read_title_from_user_input
    on_spotify = read_on_spotify_from_user_input

    create_new_album(publish_date, title, on_spotify)
    puts "Created album: title: #{title}, publish date: #{publish_date}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_title_from_user_input
    puts 'Enter album title:'
    gets.chomp
  end

  def read_music_published_date_from_user_input
    puts 'Enter publish date (YYYY-MM-DD):'
    gets.chomp
  end

  def read_on_spotify_from_user_input
    puts 'Is the album on Spotify? (true/false):'
    gets.chomp.downcase == 'true'
  end

  def create_new_album(publish_date, title, on_spotify)
    album = MusicAlbum.new(publish_date, title, on_spotify: on_spotify)
    @music_albums << album
    album
  end
end
