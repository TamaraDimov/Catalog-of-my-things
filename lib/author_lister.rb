require_relative 'author'

class AuthorLister
  def initialize(authors)
    @authors = authors
  end

  def list_all_authors
    puts 'All authors:'
    if @authors.empty?
      puts 'No authors available.'
    else
      @authors.each do |author|
        puts "ID: \"#{author.id}\", First name: \"#{author.first_name}\", " \
             "Last name: \"#{author.last_name}\", Item ID: \"#{author.items.id}\""
      end
    end
  end
end
