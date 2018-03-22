require('pg')
require_relative('artist')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(new_album)
    @id = new_album["id"].to_i
    @title = new_album['title']
    @genre = new_album['genre']
    @artist_id = new_album['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES($1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @artist_id]
    albums_hash =  SqlRunner.run(sql, values)
    @id = albums_hash[0]["id"].to_i
  end

  def self.list_all()
    sql = "SELECT * FROM albums;"
    albums_hash = SqlRunner.run(sql)
    albums_object = albums_hash.map {|album| Album.new(album)}
    return albums_object
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def show_artist_for_an_album()
    sql = "SELECT * FROM artists
    WHERE id = $1;"
    values =[@artist_id]
    artist_hash = SqlRunner.run(sql, values)
    artist_object = artist_hash.map {|artist| Artist.new(artist)}
    return artist_object
  end

  def edit_album()
    sql = "UPDATE albums
    SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values =[@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

end
