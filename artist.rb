require('pg')
require_relative('./db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(new_artist)
    @id = new_artist['id'].to_i
    @name = new_artist['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES($1)
    RETURNING id;"
    values = [@name]
    artists_hash =  SqlRunner.run(sql, values)
    @id = artists_hash[0]["id"].to_i
  end

  def self.list_all()
    sql = "SELECT * FROM artists;"
    artists_hash = SqlRunner.run(sql)
    artists_object = artists_hash.map {|artist| Artist.new(artist)}
    return artists_object
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def list_albums_by_artist()
    sql = "SELECT * FROM albums
    WHERE artist_id = $1;"
    values =[@id]
    albums_hash = SqlRunner.run(sql, values)
    albums_object = albums_hash.map {|album| Album.new(album)}
    return albums_object
  end

  def edit_artist()
    sql = "UPDATE artists
    SET (name) = ($1) WHERE id = $2;"
    values =[@name, @id]
    SqlRunner.run(sql, values)
  end

end
