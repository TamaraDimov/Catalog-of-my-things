require_relative 'item'

class Label < Item
  attr_accessor :id, :title, :color, :items

  def initialize(title, color, items, id:0)
    @id = id.zero? ? rand(1000..10_000) : id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_h
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.to_h
    }
  end
end