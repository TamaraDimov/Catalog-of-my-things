require './app'

class Start
  def call_options
    list_options.merge(add_options)
  end

  def list_options
    {
      '1' => -> { @app.list_all_books },
      '2' => -> { @app.list_all_music_albums },
      '3' => -> { @app.list_of_games },
      '4' => -> { @app.list_all_labels },
      '5' => -> { @app.list_all_authors },
      '6' => -> { @app.list_all_sources }
    }
  end

  def add_options
    {
      '7' => lambda {
        @app.add_a_book
        puts "Book added successfully\n"
      },
      '8' => lambda {
        @app.add_a_music_album
        puts "Music album added successfully\n"
      },
      '9' => lambda {
        @app.add_a_game
        puts "Game added successfully\n"
      },
      '10' => -> {
        app.save_data
        puts 'App is exiting. Goodbye!' 
      }
    }
  end

  def execute
    @app = App.new
    main = Main.new
    loop do
      main.display_menu
      calls = call_options
      choice = gets.chomp
      if calls[choice]
        calls[choice].call
        break if choice == '10'
      else
        puts 'Sorry, the provided option does not exist'
      end
      puts ' '
    end
  end
end
