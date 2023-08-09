require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archived, publisher, cover_state, id:0)
    super(publish_date, archived: archived)
    @id = id.zero? ? rand(1000..10_000) : id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    true if super || cover_state == false
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date.to_s,
      publisher: @publisher.to_s,
      cover_state: @cover_state.to_s,
    }
  end
end
