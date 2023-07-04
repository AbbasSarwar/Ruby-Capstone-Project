require_relative 'item' 

class Label
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
