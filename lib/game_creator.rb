require_relative 'game'
require_relative 'author'
require_relative '../item'
require 'date'

class GameCreator
  def initialize(games, authors)
    @games = games
    @authors = authors
    @items = []
  end

  def create_game
    publish_date = read_game_published_date_from_user_input
    multiplayer = read_multiplayer_from_user_input
    last_played_at = read_last_played_at_from_user_input
    first_name = read_first_name_from_user_input
    last_name = read_last_name_from_user_input

    game = create_new_game(publish_date, multiplayer, last_played_at)
    puts "Created game '(Publish date: #{game.publish_date}, " \
         "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at})."
    items = create_item(publish_date)
    author = create_new_author(first_name, last_name, items)
    puts "Created author '#{author.full_name}' (ID: #{author.id})."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_game_published_date_from_user_input
    print 'Publish date (YYYY-MM-DD): '
    publish_date_input = gets.chomp
    Date.parse(publish_date_input)
  end

  def read_multiplayer_from_user_input
    print 'Multiplayer (y/n): '
    multiplayer_input = gets.chomp.downcase
    case multiplayer_input
    when 'y' || 'Y'
      multiplayer_input = true
    when 'n' || 'N'
      multiplayer_input = false
    end
    multiplayer_input
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

  def create_item(publish_date)
    items = Item.new(publish_date)
    @items << items
    items
  end

  def read_first_name_from_user_input
    print 'First Name: '
    gets.chomp
  end

  def read_last_name_from_user_input
    print 'Last Name: '
    gets.chomp
  end

  def create_new_author(first_name, last_name, items)
    author = Author.new(first_name, last_name, items)
    @authors << author
    author
  end
end
