require_relative 'app'

def options
  print "
    1. List all Musics
    2. List all genres (e.g 'Comedy', 'Thriller')
    3. List all authors (e.g. 'Stephen King')
    4. List of games
    5. List all labels (eg. 'Gift', 'New')
    6. List all books
    7. Add a book
    8. Add a music album
    9. Add a game
    10. Archive item
    11. Quit
    "
end

app = App.new

loop do
  options
  num = gets.chomp.to_i

  case num
  when 1
    app.list_music_albums
  when 2
    app.list_genres
  when 5
    app.list_books
  when 6
    app.list_labels
  when 7
    app.add_book
  when 8
    app.add_music_album
  when 11
    puts 'Thank you for using the app!'
    break
  else
    puts 'Invalid Option'
  end
end
