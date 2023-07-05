require_relative 'music_album'
require_relative 'genre'
require_relative 'preserve'

require 'date'

class App
  def initialize
    @preserve = Preserve.new
    @preserve.load_music_albums
    @preserve.load_genres
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
end
