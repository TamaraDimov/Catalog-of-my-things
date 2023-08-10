require './Start'

class Main
  def options
    ['List all books',
     'List all music albums',
     'List of games',
     'List all labels',
     'List all authors',
     'Add a book',
     'Add a music album',
     'Add a game',
     'Exit']
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    options.each_with_index { |option, i| puts "#{i + 1} - #{option}" }
  end
end

init = Start.new
init.execute
