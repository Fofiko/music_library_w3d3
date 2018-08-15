require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(info)
    @id = info["id"].to_i if info["id"]
    @title = info["title"]
    @genre = info["genre"]
    @artist_id = info["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (title, genre, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(artist.first)
    return result
  end

  def update()
    sql = "UPDATE albums
    SET (title, genre, artist_id)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    result = albums.map{|vinyl| Album.new(vinyl)}
    return result
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    album = Album.new(result.first)
    return album
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end
