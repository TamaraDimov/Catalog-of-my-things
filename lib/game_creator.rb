require_relative '../item'

class GameCreator
  def initialize(games)
    @games = games
  end

  def create_game
    title = read_game_title_from_user_input
    multiplayer = read_multiplayer_from_user_input

    game = create_new_game(title, multiplayer)
    puts "Created game '#{game.title}' (Multiplayer: #{game.multiplayer})."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_game_title_from_user_input
    print 'Title: '
    gets.chomp
  end

  def read_multiplayer_from_user_input
    print 'Multiplayer (true/false): '
    multiplayer_input = gets.chomp.downcase
    multiplayer_input == 'true'
  end

  def create_new_game(title, multiplayer)
    game = Game.new(title, multiplayer: multiplayer)
    @games << game
    game
  end
end