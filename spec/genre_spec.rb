require_relative '../genre'
require_relative '../item'
require 'Date'

describe Genre do
  it 'it should return name' do
    genre = Genre.new(nil, 'CSW')
    expect(genre.name).to eq('CSW')
  end

  it 'it should instance' do
    genre = Genre.new(nil, 'PRO')
    item = Item.new(nil, Date.parse('2022-02-02'))
    genre.add_item(item)
    expect(genre.items.length).to eq 1
  end
end
