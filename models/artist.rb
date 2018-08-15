require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(info)
    @id = info["id"].to_i if info["id"]
    @name = info["name"]
  end


end
