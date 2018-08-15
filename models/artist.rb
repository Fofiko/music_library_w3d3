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
    result = albums.map { |album_hash| Album.new(album_hash)}
    return result
  end



end
