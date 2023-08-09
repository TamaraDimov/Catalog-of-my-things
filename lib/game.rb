require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer: true, last_played_at: Time.now, id: 0)
    super(publish_date)
    @id = id.zero? ? rand(1000..10_000) : id
    @publish_date = publish_date
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end

  def two_years
    two_years_ago = Time.now - 2.years
    true if @last_played_at >= two_years_ago
  end

  def can_be_archived?
    super && two_years_ago
  end
end
