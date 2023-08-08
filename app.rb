require_relative 'lib/utilities/load'
require_relative 'lib/utilities/save'
require_relative 'lib/game_creator'
require_relative 'lib/game_lister'
require 'json'
require 'fileutils'

class App
  GAMES_FILE = './data/games.json'.freeze
  AUTHORS_FILE = './data/authors.json'.freeze

  def initialize
    @games = []
    @authors = []
    load_data
    @games_lister = GameLister.new(@games)
    @games_creator = GameCreator.new(@games, @authors)
    
  end
  
  def list_all_books; end

  def list_all_music_albums; end

  def list_of_games
    @games_lister.list_all_games
  end

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

  def load_data
    @games = Load.new(GAMES_FILE, :load_games_from_json).execute || []
    # @authors = Load.new(AUTHORS_FILE, :load_authors_from_json).execute || []
  end

end
