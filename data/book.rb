require_relative 'item'

class Book < Item
  attr_accessor :author, :cover_state

  def initialize(options = {})
    super(options[:genre], options[:source], options[:label], options[:publish_date], options[:archived])
    @author = options[:author]
    @cover_state = options[:cover_state]
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
