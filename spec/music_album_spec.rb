require_relative '../item'
require_relative '../lib/music_album'
require 'date'

RSpec.describe MusicAlbum do
  let(:publish_date) { Date.new(2023, 1, 1) }
  let(:album_title) { 'Awesome Album' }
  let(:on_spotify) { true }
  let(:album) { MusicAlbum.new(publish_date, album_title, on_spotify: on_spotify) }

  describe '#initialize' do
    it 'sets the publish date, title, and on_spotify attribute' do
      expect(album.publish_date).to eq(publish_date)
      expect(album.title).to eq(album_title)
      expect(album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#can_be_archived?' do
    context 'when on_spotify is true and it can be archived' do
      it 'returns true' do
        expect(album.can_be_archived?).to be(true)
      end
    end

    context 'when on_spotify is false' do
      let(:on_spotify) { false }

      it 'returns false' do
        expect(album.can_be_archived?).to be(false)
      end
    end
  end

  describe '#move_to_archive' do
    it 'archives the album if it can be archived' do
      allow(album).to receive(:can_be_archived?).and_return(true)
      album.move_to_archive
      expect(album.archived).to be(true)
    end
  end
end
