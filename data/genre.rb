require_relative "../item"

class Genre < Item
    attr_reader :id ,:name ,:items
    def initialize(id ,name)
        super(id)
        @id = Random.rand(1..1000)
        @name = name
        @items = []
    end

    def add_item(item)
        item.genre = self
        items << item
    end
end
