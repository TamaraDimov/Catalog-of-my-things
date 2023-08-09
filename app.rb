require_relative 'lib/utilities/load'
require_relative 'lib/utilities/save'
require_relative 'lib/game_creator'
require_relative 'lib/game_lister'
require_relative 'lib/author_lister'
require_relative 'lib/music_album_creator'
require_relative 'book'
require_relative 'item'
require_relative 'start'
require_relative 'label'
require 'json'
require 'fileutils'
require 'date'

class App
  GAMES_FILE = './data/games.json'.freeze
  AUTHORS_FILE = './data/authors.json'.freeze
  BOOKS_FILE = './data/books.json'.freeze
  LABELS_FILE = './data/labels.json'.freeze



  attr_accessor :books, :labels, :authors

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @items = []
    @music_albums = []
    @genres = []
    
    load_data
    @games_lister = GameLister.new(@games)
    @authors_lister = AuthorLister.new(@authors)
    @games_creator = GameCreator.new(@games, @authors)
    @music_album_creator = MusicAlbumCreator.new(@music_albums, @genres)
  end

  def add_label(publish_date)
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    items = create_item(publish_date)
    label = Label.new(title, color, items)
    @labels << label
  end

  def add_a_book
    print 'Publish_date (YYYY-MM-DD): '
    publish_date = gets.chomp
    Date.parse(publish_date)
    print 'publisher: '
    publisher = gets.chomp
    puts 'Please enter the cover state'
    cover_state = gets.chomp
    book = Book.new(publish_date, false, publisher, cover_state)
    @books << book
    add_label(publish_date)
  end

  def create_item(publish_date)
    items = Item.new(publish_date)
    @items << items
    items
  end

  def list_all_books
    return 'Book list is empty' if @books.empty?

    @books.each_with_index do |book, index|
      puts "#{index + 1}. "
      puts "   Publish Date: #{book.publish_date}"
      puts "   Publisher: #{book.publisher}"
      puts "   Cover State: #{book.cover_state}"
      puts
    end
  end

  def list_all_music_albums; end

  def list_all_labels
    return 'labels list is empty' if @labels.empty?

    @labels.each_with_index do |label, index|
      puts "#{index + 1}. "
      puts "   Title: #{label.title} "
      puts "   Color: #{label.color}"
      puts "   Item Id: #{label.items.id}"
      puts
    end
  end

  def list_of_games
    @games_lister.list_all_games
  end

  def list_all_authors
    @authors_lister.list_all_authors
  end

  def add_a_music_album
    @music_album_creator.create_album
  end

  def add_a_game
    @games_creator.create_game
  end

  def save_data
    Save.new(@games.map(&:to_h), GAMES_FILE).execute
    Save.new(@authors.map(&:to_h), AUTHORS_FILE).execute
    Save.new(@books.map(&:to_h), BOOKS_FILE).execute
    Save.new(@labels.map(&:to_h), LABELS_FILE).execute
  end

  def load_data
    @games = Load.new(GAMES_FILE, :load_games_from_json).execute || []
    @authors = Load.new(AUTHORS_FILE, :load_authors_from_json).execute || []
    @books = Load.new(BOOKS_FILE, :load_books_from_json).execute || []
    @labels = Load.new(LABELS_FILE, :load_labels_from_json).execute || []
  end
end
