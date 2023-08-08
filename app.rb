require_relative 'book'
require_relative 'item'
require_relative 'start'
require 'json'

class App
  attr_accessor :books, :labels, :authors

  def initialize
    @books = []
    @labels = []
    @authors = []
  end

  def add_a_book
    print 'publish_date: '
    publish_date = gets.chomp
    print 'publisher: '
    publisher = gets.chomp
    puts 'Please enter the cover state'
    cover_state = gets.chomp
    book = Book.new(nil, publish_date, publisher, cover_state)
    @books << book
  end

  def list_all_books
    return 'Book list is empty' if @books.empty?

    @books.each_with_index do |book, index|
      puts "#{index + 1}. "
      # puts "   Authors: #{book.authors.join(', ')}"
      puts "   Publish Date: #{book.publish_date}"
      puts "   Publisher: #{book.publisher}"
      puts "   Cover State: #{book.cover_state}"
      puts
    end
  end
end
