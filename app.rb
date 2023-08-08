require_relative 'lib/utilities/save'
require_relative 'lib/game_creator'
require 'json'
require 'fileutils'

class App
  GAMES_FILE = './data/games.json'.freeze
  AUTHORS_FILE = './data/authors.json'.freeze

  def initialize
    @games = []
    @authors = []
    @games_creator = GameCreator.new(@games)
    # @authors_creator = AuthorsCreator.new(@authors)    
  end
  
  def list_all_books; end

  def list_all_music_albums; end

  def list_of_games; end

  def list_all_labels; end

  def list_all_authors; end

  def list_all_sources; end

  def add_a_book; end

  def add_a_music_album; end

  def add_a_game
    @games_creator.create_game
  end

  def save_data
    Save.new(@games.map(&:to_h), GAMES_FILE).execute
    Save.new(@authors.map(&:to_h), AUTHORS_FILE).execute
  end

end
