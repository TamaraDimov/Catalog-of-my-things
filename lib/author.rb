require_relative '../item'

class Author < Item
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, items, id: 0)
    super(publish_date)
    @id = id.zero? ? rand(1000..10_000) : id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def to_h
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.to_h
    }
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end
