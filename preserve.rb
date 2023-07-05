require 'json'
require_relative 'music_album'
require_relative 'genre'

class Preserve
  attr_accessor :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
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
