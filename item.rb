class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true if @publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
