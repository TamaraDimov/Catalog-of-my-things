require_relative 'lib/utilities/load'
require_relative 'lib/utilities/save'
require_relative 'lib/game_creator'
require_relative 'lib/game_lister'
require_relative 'lib/author_lister'
require_relative 'book'
require_relative 'item'
require_relative 'start'
require_relative 'label'
require 'json'
require 'json'
require 'fileutils'

class App
  GAMES_FILE = './data/games.json'.freeze
  AUTHORS_FILE = './data/authors.json'.freeze

  attr_accessor :books, :labels, :authors

  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
    @authors = []
    load_data
    @games_lister = GameLister.new(@games)
    @authors_lister = AuthorLister.new(@authors)
    @games_creator = GameCreator.new(@games, @authors)
  end

  def add_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(nil, title, color)
    @labels << label
  end

  def add_a_book
    print 'Publish_date: '
    publish_date = gets.chomp
    print 'publisher: '
    publisher = gets.chomp
    puts 'Please enter the cover state'
    cover_state = gets.chomp
    book = Book.new(nil, publish_date, publisher, cover_state)
    @books << book
    add_label
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

  def list_all_labels
    return 'labels list is empty' if @labels.empty?

    @labels.each_with_index do |label, index|
      puts "#{index + 1}. "
      puts "   Title: #{label.title} "
      puts "   Color: #{label.color}"
      puts
    end

  def list_all_music_albums; end

  def list_of_games
    @games_lister.list_all_games
  end

  def list_all_authors
    @authors_lister.list_all_authors
  end

  def list_all_sources; end

  def add_a_music_album; end

  def add_a_game
    @games_creator.create_game
  end

  def save_data
    Save.new(@games.map(&:to_h), GAMES_FILE).execute
    Save.new(@authors.map(&:to_h), AUTHORS_FILE).execute
  end

  def load_data
    @games = Load.new(GAMES_FILE, :load_games_from_json).execute || []
    @authors = Load.new(AUTHORS_FILE, :load_authors_from_json).execute || []
  end
end
