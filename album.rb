require('pg')
require_relative('artist')

class Album

  attr_accessor :id, :title, :genre, :artist_id

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

end
