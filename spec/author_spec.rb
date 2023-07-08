require_relative '../author'
require_relative '../game'

RSpec.describe Author do
  describe '#initialize' do
    it 'sets the attributes correctly' do
      first_name = 'Blessing'
      last_name = 'Ekiugbo'

      author = Author.new(first_name, last_name)

      expect(author.first_name).to eq(first_name)
      expect(author.last_name).to eq(last_name)
      expect(author.items).to be_empty
    end
  end
end
