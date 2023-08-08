require_relative '../item'
require_relative '../lib/music_album'
require 'date'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the album is on Spotify and the publish date is in the past' do
      it 'returns true' do
        album = MusicAlbum.new(Date.today - 11, on_spotify: true)
        expect(album.can_be_archived?).to be true
      end
    end

    context 'when the album is not on Spotify' do
      it 'returns false' do
        album = MusicAlbum.new(Date.today - 5, on_spotify: false)
        expect(album.can_be_archived?).to be false
      end
    end

    context 'when the album is on Spotify but the publish date is in the future' do
      it 'returns false' do
        album = MusicAlbum.new(Date.today + 5, on_spotify: true)
        expect(album.can_be_archived?).to be false
      end
    end
  end

  describe '#move_to_archive' do
    it 'archives the album if it can be archived' do
      album = MusicAlbum.new(Date.today - 11, on_spotify: true)
      album.move_to_archive
      expect(album.archived).to be true
    end

    it 'does not archive the album if it cannot be archived' do
      album = MusicAlbum.new(Date.today + 5, on_spotify: true)
      album.move_to_archive
      expect(album.archived).to be false
    end
  end
end
