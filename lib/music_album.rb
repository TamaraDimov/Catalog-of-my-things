require_relative '../item'

class MusicAlbum < Item
  attr_accessor :title, :on_spotify

  def initialize(publish_date, title, on_spotify: false)
    super(publish_date)
    @title = title
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
