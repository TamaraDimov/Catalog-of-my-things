require_relative '../item'
require 'date'

describe Item do
  let(:publish_date) { Date.today }
  let(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'sets the publish date' do
      expect(item.publish_date).to eq(publish_date)
    end

    it 'sets archived to false by default' do
      expect(item.archived).to be_falsey
    end

    it 'generates a random id if not provided' do
      expect(item.id).to be_between(1, 1000)
    end

    it 'uses the provided id if given' do
      item_with_id = Item.new(publish_date, id: 1234)
      expect(item_with_id.id).to eq(1234)
    end

    it 'initializes authors as an empty array' do
      expect(item.authors).to be_empty
    end

    it 'initializes genre as an empty array' do
      expect(item.genre).to be_empty
    end
  end

  describe '#can_be_archived?' do
    context 'when the publish date is greater than 10' do
      let(:publish_date) { Date.today + 11 }

      it 'returns true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the item can be archived' do
      before do
        allow(item).to receive(:can_be_archived?).and_return(true)
      end

      it 'sets archived to true' do
        item.move_to_archive
        expect(item.archived).to be_truthy
      end
    end

    context 'when the item cannot be archived' do
      before do
        allow(item).to receive(:can_be_archived?).and_return(false)
      end

      it 'does not change the value of archived' do
        item.move_to_archive
        expect(item.archived).to be_falsey
      end
    end
  end

  describe '#add_author' do
    let(:author) { instance_double('Author', items: []) }

    it 'adds the author to the item' do
      item.add_author(author)
      expect(item.authors).to include(author)
    end

    it 'adds the item to the author' do
      item.add_author(author)
      expect(author.items).to include(item)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the item' do
      expected_hash = {
        id: item.id,
        publish_date: publish_date.to_s,
        archived: item.archived
      }
      expect(item.to_h).to eq(expected_hash)
    end
  end

  describe '#label=' do
    it 'sets the label' do
      item.label = 'New Label'
      expect(item.instance_variable_get(:@label)).to eq('New Label')
    end
  end
end
