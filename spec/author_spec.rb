require_relative '../author'
require_relative '../item'
require 'date'

describe Author do
  context 'With valid arguments' do
    it 'should return the correct first name' do
      author = Author.new(nil, 'Tega', 'Uche')
      expect(author.first_name).to eq 'Tega'
    end

    it 'should return the correct last name' do
      author = Author.new(nil, 'Tega', 'Uche')
      expect(author.last_name).to eq 'Uche'
    end

    it 'should add item to the instance' do
      author = Author.new(nil, 'Tega', 'Uche')
      item = Item.new(nil, '1999-08-07')
      author.add_item(item)
      expect(author.items.length).to eq 1
    end
  end
end
    
    

