require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "The Growlers"
  })

artist1.save()

artist2 = Artist.new({
  "name" => "Hot Chip"
  })

artist2.save()

album1 = Album.new({
  "title" => "Casual Acquaintances",
  "genre" => "surf rock",
  "artist_id" => artist1.id
  })

album1.save()

album2 = Album.new({
  "title" => "Chinese Fountain",
  "genre" => "surf rock",
  "artist_id" => artist1.id
  })

album2.save()


album3 = Album.new({
  "title" => "Hung At Heart",
  "genre" => "folk rock",
  "artist_id" => artist1.id
  })

album3.save()


album4 = Album.new({
  "title" => "In Our Heads",
  "genre" => "pop",
  "artist_id" => artist2.id
  })

album4.save()

album5 = Album.new({
  "title" => "Why make sense?",
  "genre" => "pop",
  "artist_id" => artist2.id
  })

album5.save()

binding.pry
nil
