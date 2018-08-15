require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(info)
    @id = info["id"].to_i if info["id"]
    @title = info["title"]
    @genre = info["genre"]
    @artist_id = info["artist_id"].to_i
  end


end
