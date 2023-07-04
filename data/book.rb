require_relative 'item' 

class Book < Item
  attr_accessor :author, :cover_state

  def initialize(genre, source, label, publish_date, archived, author, cover_state)
    super(genre, source, label, publish_date, archived)
    @author = author
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == "bad"
  end
end
