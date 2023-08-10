require_relative '../item'
require_relative '../lib/game'
require 'active_support/core_ext/integer/time'

describe Game do
  let(:publish_date) { Time.now }
  let(:game) { Game.new(publish_date) }

  describe '#initialize' do
    it 'sets the publish_date, multiplayer, and last_played_at' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to be_within(1).of(Time.now)
    end
  end

  describe '#two_years' do
    context 'when last played within the last two years' do
      it 'returns true' do
        game.last_played_at = Time.now - 1.year
        expect(game.two_years).to be true
      end
    end

    context 'when last played more than two years ago' do
      it 'returns nil' do
        game.last_played_at = Time.now - 3.years
        expect(game.two_years).to be nil
      end
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the game can be archived' do
      allow(game).to receive(:two_years_ago).and_return(true)
      allow(game).to receive(:super).and_return(true)
      expect(game.can_be_archived?).to be true

      allow(game).to receive(:two_years_ago).and_return(false)
      allow(game).to receive(:super).and_return(true)
      expect(game.can_be_archived?).to be false

      allow(game).to receive(:two_years).and_return(true)
      allow(game).to receive(:super).and_return(false)
      expect(game.can_be_archived?).to be false
    end
  end
end
