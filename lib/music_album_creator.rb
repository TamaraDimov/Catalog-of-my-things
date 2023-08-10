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

    genre_name = read_genre_from_user_input
    genre = find_or_create_genre(genre_name)

    create_new_album(publish_date, title, on_spotify, genre)
    puts "Created album: Album title: #{title}, Publish date: #{publish_date}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_title_from_user_input
    print 'Enter album title: '
    gets.chomp
  end

  def read_music_published_date_from_user_input
    print 'Enter publish date (YYYY-MM-DD): '
    gets.chomp
  end

  def read_on_spotify_from_user_input
    print 'Is the album on Spotify? (true/false): '
    gets.chomp.downcase == 'true'
  end

  def read_genre_from_user_input
    print 'Enter genre name: '
    gets.chomp
  end

  def find_or_create_genre(name)
    existing_genre = @genres.find { |genre| genre.name == name }
    return existing_genre if existing_genre

    new_genre = Genre.new(name)
    @genres << new_genre
    new_genre
  end

  def create_new_album(publish_date, title, on_spotify, genre)
    album = MusicAlbum.new(publish_date, title, on_spotify: on_spotify)
    genre.add_item(album)
    @music_albums << album
    album
  end
end
