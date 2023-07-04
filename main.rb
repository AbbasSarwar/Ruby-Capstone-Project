require 'date'
require_relative 'item'

def options
  print "
    1. Create Item
    2. Archieve item
    3. Quit
    "
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
  items << item
  puts "Item created ID: #{item.id}"
end
items = []

def archive_item(items)
  puts 'archieve item (ID): '
  item_id = gets.chomp.to_i

  item_archive = items.find { |item| item.id == item_id }
  if item_archive.nil?
    puts 'item not found'
  else
    item_archive.move_to_archive
    puts "Item with ID #{item_archive.id} archived."
  end
end

loop do
  options
  num = gets.chomp.to_i

  case num
  when 1
    create_item(items)
  when 2
    archive_item(items)
  when 3
    puts 'Exiting'
    break
  else
    puts 'Invalid Option'
  end
end