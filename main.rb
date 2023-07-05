require_relative 'app'

def options
  print "
    1. List all Musics
    2. List all genres (e.g 'Comedy', 'Thriller')
    3. List all authors (e.g. 'Stephen King')
    4. List of games
    5. List all labels (eg. 'Gift', 'New')
    6. Add a book
    7. Add a music album
    8. Add a game
    9. Archieve item
    10. Quit
    "
end

loop do
  options
  app = App.new
  num = gets.chomp.to_i

  case num
  when 1
    app.list_music_albums
  when 2
    app.list_genres
  when 7
    app.add_music_album
  when 10
    puts 'Thank you for using the app!'
    break
  else
    puts 'Invalid Option'
  end
end
