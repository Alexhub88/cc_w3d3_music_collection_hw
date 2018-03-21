require('pg')
require_relative('./db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :id, :name

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

end
