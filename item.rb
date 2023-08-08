class Item
  attr_accessor :publish_date, :archived, :authors
  attr_reader :id

  def initialize(publish_date, archived: false, id: 0)
    @id = id.zero? ? rand(1..1000) : id
    @publish_date = publish_date
    @archived = archived
    @authors = []
  end

  def can_be_archived?
    return true if @publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  def add_author(author)
    @authors << author
    author.items << self unless author.items.include?(self)
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date.to_s,
      archived: @archived
    }
  end
end
