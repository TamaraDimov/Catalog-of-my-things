require_relative '../item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    super(publish_date)
    @id = id.zero? ? rand(1000..10_000) : id
    @name = name
    @items = []
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      name: @name,
      items: @items.to_h
    }
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
