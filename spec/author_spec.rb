require_relative '../item'
require_relative '../lib/author'

describe Author do
  let(:author) { Author.new('Ruby', 'Guy') }
  let(:item) { Item.new(Time.now - 5, archived: false) }

  describe '#initialize' do
    it 'sets the first name and last name' do
      expect(author.first_name).to eq('Ruby')
      expect(author.last_name).to eq('Guy')
    end

    it 'generates a random ID' do
      expect(author.id).to be_a(Integer)
    end

    it 'initializes an empty array of items' do
      expect(author.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      author.add_item(item)
      expect(author.instance_variable_get(:@items)).to include(item)
    end

    it 'adds the author to the item' do
      author.add_item(item)
      expect(item.authors).to include(author)
    end
  end
end