require_relative 'game'
require_relative 'author'
require 'date'

class GameCreator
  def initialize(games, authors)
    @games = games
    @authors = authors
  end

  def create_game
    publish_date = read_game_published_date_from_user_input
    multiplayer = read_multiplayer_from_user_input
    last_played_at = read_last_played_at_from_user_input
    first_name = read_first_name_from_user_input
    last_name = read_last_name_from_user_input

    game = create_new_game(publish_date, multiplayer, last_played_at)
    puts "Created game '(Publishdate: #{game.publish_date},Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at})."
    author = create_new_author(first_name, last_name)
    puts "Created author '#{author.full_name}' (ID: #{author.id})."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_game_published_date_from_user_input
    print 'Publish date (YYYY-MM-DD): '
    publish_date_input = gets.chomp
    publish_date = Date.parse(publish_date_input)    
  end

  def read_multiplayer_from_user_input
    print 'Multiplayer (true/false): '
    multiplayer_input = gets.chomp.downcase
    multiplayer_input == 'true'
  end

  def read_last_played_at_from_user_input
    print 'Last played at (YYYY-MM-DD): '
    last_played_at_input = gets.chomp
    Date.parse(last_played_at_input)
  end

  def create_new_game(publish_date, multiplayer, last_played_at)
    game = Game.new(publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    @games << game
    game
  end

  def read_first_name_from_user_input
    print 'First Name: '
    gets.chomp
  end

  def read_last_name_from_user_input
    print 'Last Name: '
    gets.chomp
  end

  def create_new_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end
end