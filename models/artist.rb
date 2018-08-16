require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(info)
    @id = info["id"].to_i if info["id"]
    @name = info["name"]
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    result = albums.map { |vinyl| Album.new(vinyl)}
    return result
  end

  def update()
    sql = "UPDATE artists
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    result = artists.map{|act| Artist.new(act)}
    return result
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = Artist.new(result.first)
    return artist
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
