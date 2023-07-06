require 'json'
require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'

class Preserve
  attr_accessor :genres, :music_albums, :books, :labels

  def initialize
    @genres = []
    @music_albums = []
    @books = []
    @labels = []
  end

  def load_books
    return unless File.exist?('./data/books.json')

    books_loaded = JSON.parse(File.read('./data/books.json'))
    books_loaded.each do |book|
      new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
      new_label = @labels.select { |label| label.id == book['label_id'] }[0]
      new_book.add_label(new_label)
      @books << new_book
    end
  end

  def load_labels
    return unless File.exist?('./data/labels.json')

    labels_loaded = JSON.parse(File.read('./data/labels.json'))
    labels_loaded.each do |label|
      new_label = Label.new(label['id'], label['title'], label['color'])
      @labels << new_label
    end
  end

  def load_genres
    return unless File.exist?('./data/genres.json')

    genres_loaded = JSON.parse(File.read('./data/genres.json'))
    genres_loaded.each do |genre|
      new_genre = Genre.new(genre['id'], genre['name'])
      @genres << new_genre
    end
  end

  def load_music_albums
    return unless File.exist?('./data/music_albums.json')

    music_albums_loaded = JSON.parse(File.read('./data/music_albums.json'))
    music_albums_loaded.each do |music_album|
      new_music_album = MusicAlbum.new(music_album['id'], music_album['publish_date'], music_album['on_spotify'])
      genre_id = music_album['genre_id']
      new_genre = @genres.find { |genre| genre.id == genre_id }
      new_music_album.add_genre(new_genre) unless new_genre.nil?
      @music_albums << new_music_album
    end
  end

  def save_music_album(music_album)
    new_music_album = { id: music_album.id, publish_date: music_album.publish_date,
                        on_spotify: music_album.on_spotify, genre_id: music_album.genre.id }
    if File.exist?('./data/music_albums.json')
      music_albums_loaded = JSON.parse(File.read('./data/music_albums.json'))
      music_albums_loaded << new_music_album
      File.write('./data/music_albums.json', JSON.pretty_generate(music_albums_loaded))
    else
      File.write('./data/music_albums.json', JSON.pretty_generate([new_music_album]))
    end
  end

  def save_genre(genre)
    new_genre = { id: genre.id, name: genre.name }
    if File.exist?('./data/genres.json')
      genres_loaded = JSON.parse(File.read('./data/genres.json'))
      genres_loaded << new_genre
      File.write('./data/genres.json', JSON.pretty_generate(genres_loaded))
    else
      File.write('./data/genres.json', JSON.pretty_generate([new_genre]))
    end
  end

  def save_book(book)
    new_book = { id: book.id, publish_date: book.publish_date, publisher: book.publisher,
                 cover_state: book.cover_state, label_id: book.label.id }
    if File.exist?('./data/books.json')
      books_loaded = JSON.parse(File.read('./data/books.json'))
      books_loaded << new_book
      File.write('./data/books.json', JSON.pretty_generate(books_loaded))
    else
      File.write('./data/books.json', JSON.pretty_generate([new_book]))
    end
  end

  def save_label(label)
    new_label = { id: label.id, title: label.title, color: label.color }
    if File.exist?('./data/labels.json')
      labels_loaded = JSON.parse(File.read('./data/labels.json'))
      labels_loaded << new_label
      File.write('./data/labels.json', JSON.pretty_generate(labels_loaded))
    else
      File.write('./data/labels.json', JSON.pretty_generate([new_label]))
    end
  end
end



p = Preserve.new
p.load_music_albums
p.music_albums.each do |music_album|
  puts "ID: #{music_album.id}"
  puts "Publish Date: #{music_album.publish_date}"
  puts "On Spotify: #{music_album.on_spotify}"
  puts "Genre: #{music_album.genre.name}" if music_album.genre
  puts '-------------------------'
end


def load_books
  return unless File.exist?('./data/books.json')

  books_loaded = JSON.parse(File.read('./data/books.json'))
  books_loaded.each do |book|
    new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
    label_id = book['label_id']
    new_label = @labels.find { |label| label.id == label_id }
    new_book.add_label(new_label) unless new_label.nil?
    @books << new_book
  end
end
