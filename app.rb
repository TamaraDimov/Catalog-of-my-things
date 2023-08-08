require_relative 'book'
require_relative 'item'
require_relative 'start'
require_relative 'label'
require 'json'

class App
  attr_accessor :books, :labels, :authors

  def initialize
    @books = []
    @labels = []
    @authors = []
  end

  def add_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(nil, title, color)
    @labels << label
  end

  def add_a_book
    print 'Publish_date: '
    publish_date = gets.chomp
    print 'publisher: '
    publisher = gets.chomp
    puts 'Please enter the cover state'
    cover_state = gets.chomp
    book = Book.new(nil, publish_date, publisher, cover_state)
    @books << book
    add_label
  end

  def list_all_books
    return 'Book list is empty' if @books.empty?

    @books.each_with_index do |book, index|
      puts "#{index + 1}. "
      puts "   Publish Date: #{book.publish_date}"
      puts "   Publisher: #{book.publisher}"
      puts "   Cover State: #{book.cover_state}"
      puts
    end
  end

  def list_all_labels
    return 'labels list is empty' if @labels.empty?

    @labels.each_with_index do |label, index|
      puts "#{index + 1}. "
      puts "   Title: #{label.title} "
      puts "   Color: #{label.color}"
      puts
    end
  end
end
