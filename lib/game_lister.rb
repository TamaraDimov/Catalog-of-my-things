require_relative 'game'

class GameLister
  def initialize(games)
    @games = games
  end

  def list_all_games
    puts 'All games:'
    if @games.empty?
      puts 'No games available.'
    else
      @games.each do |game|
        puts "ID: \"#{game.id}\", Publish date: \"#{game.publish_date}\", " \
             "Multiplayer: \"#{game.multiplayer}\", Last played: \"#{game.last_played_at}\""
      end
    end
  end
end
