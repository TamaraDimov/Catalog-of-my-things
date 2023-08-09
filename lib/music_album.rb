require_relative '../item'

class MusicAlbum < Item
  attr_accessor :title, :on_spotify

  def initialize(publish_date, title, on_spotify: false)
    super(publish_date)
    @id = id.zero? ? rand(1000..10_000) : id
    @title = title
    @on_spotify = on_spotify
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      title: @title,
      on_spotify: @on_spotify
    }
  end

  def can_be_archived?
    super && on_spotify
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
