require_relative '../item'
require_relative '../lib/genre'
require 'date'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with a name' do
      genre = Genre.new('Pop')
      expect(genre.name).to eq('Pop')
    end

    it 'generates a random id for the genre' do
      genre = Genre.new('Rock')
      expect(genre.id).to be_between(1, 1000)
    end

    it 'initializes items as an empty array' do
      genre = Genre.new('Jazz')
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Electronic')
      item = Item.new(Date.today - 5)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'sets the genre of the added item' do
      genre = Genre.new('Hip Hop')
      item = Item.new(Date.today - 7)
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end

