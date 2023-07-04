class App
    def initialize
        @items = []
    end

    def create_item(items)
        puts 'Please enter Genre: '
        genre = gets.chomp
        puts 'Please enter source: '
        source = gets.chomp
        puts 'Please enter label'
        label = gets.chomp
        puts 'Please enter publish date (YYYY-MM-DD): '
        publish_date = Date.parse(gets.chomp)
        item = Item.new(genre, source, label, publish_date, false)
        @items << item
        puts "Item created ID: #{item.id}"
      end
      
      def archive_item(items)
        puts 'archieve item (ID): '
        item_id = gets.chomp.to_i
      
        item_archive = @items.find { |item| item.id == item_id }
        if item_archive.nil?
          puts 'item not found'
        else
          item_archive.move_to_archive
          puts "Item with ID #{item_archive.id} archived."
        end
      end