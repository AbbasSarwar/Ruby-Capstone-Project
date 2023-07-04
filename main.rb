require_relative 'app'

def options
  print "
    1. List all Musics
    2. List all genres (e.g 'Comedy', 'Thriller')
    3. List all authors (e.g. 'Stephen King')
    4. List of games
    5. List all labels (eg. 'Gift', 'New')
    6. Create Item
    7. Add a book
    8. Add a music album
    9. Add a game
    10. Archieve item
    11. Quit
    "
end

loop do
  options
  app = App.new
  num = gets.chomp.to_i

  case num
  when 6
    app.create_item(items)
  when 10
    app.archive_item(items)
  when 11
    puts 'Exiting'
    break
  else
    puts 'Invalid Option'
  end
end
