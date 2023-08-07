class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, publish_date, archived, publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
    super(id, publish_date, archived)
  end

  def can_be_archived?
    return true if super(id, publish_date, archived).can_be_archived? || cover_state == true
  end
end
