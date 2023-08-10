require_relative '../item'
require_relative '../book'
require 'active_support/core_ext/integer/time'

describe Book do
  let(:book) { Book.new(Time.now - 5, false, 'Publisher', true) }

  describe '#initialize' do
    it 'sets the publisher and cover state' do
      expect(book.publisher).to eq('Publisher')
      expect(book.cover_state).to be_truthy
    end

    it 'inherits attributes from the Item class' do
      expect(book.publish_date).to be_within(1).of(Time.now - 5)
      expect(book.archived).to be_falsey
    end
  end

  describe '#can_be_archived?' do
    context 'when the cover state is true' do
      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when the cover state is false' do
      let(:book) { Book.new(Time.now - 5, false, 'Publisher', false) }

      context 'and the publish date is greater than 10' do
        it 'returns true' do
          expect(book.can_be_archived?).to be_truthy
        end
      end
    end
  end
end
