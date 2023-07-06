require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'preserve'

require 'date'

class App
  def initialize
    @preserve = Preserve.new
    @preserve.load_music_albums
    @preserve.load_genres
    @preserve.load_labels
    @preserve.load_books
  end

  def list_books
    return puts 'No books found' if @preserve.books.empty?

    @preserve.books.each_with_index do |book, index|
      puts "#{index + 1}) Label: #{book.label.title}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def list_labels
    return puts 'No labels found' if @preserve.labels.empty?

    @preserve.labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end

  def list_music_albums
    return puts 'No music albums found' if @preserve.music_albums.empty?

    @preserve.music_albums.each_with_index do |music_album, index|
      puts "
      #{index + 1})  On spotify: #{music_album.on_spotify}
          Publish date: #{music_album.publish_date}
      "
    end
  end

  def list_genres
    return puts 'No genres found' if @preserve.genres.empty?

    @preserve.genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre.name}"
    end
  end

  def add_music_album
    puts 'Available on spotify? [Y / N]'
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Enter publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    new_music_album = MusicAlbum.new(nil, publish_date, on_spotify)
    puts "Enter genre details\n"
    new_genre = add_genre
    new_music_album.add_genre(new_genre)
    @preserve.music_albums.push(new_music_album)
    @preserve.save_music_album(new_music_album)
    puts 'Music album created successfully'
  end

  def add_genre
    puts 'Enter name'
    name = gets.chomp
    new_genre = Genre.new(nil, name)
    @preserve.genres.push(new_genre)
    @preserve.save_genre(new_genre)
    new_genre
  end

  def add_book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    puts 'Enter the cover state'
    cover_state = gets.chomp
    new_book = Book.new(nil, publish_date, publisher, cover_state)
    puts "Enter label details\n"
    new_label = add_label
    new_book.add_label(new_label)
    @preserve.books.push(new_book)
    @preserve.save_book(new_book)
    puts 'Book created successfully'
  end

  def add_label
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter color'
    color = gets.chomp
    new_label = Label.new(nil, title, color)
    @preserve.labels.push(new_label)
    @preserve.save_label(new_label)
    new_label
  end
end
