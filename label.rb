require_relative 'item'

class Label < Item
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color, _items)
    super()
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
