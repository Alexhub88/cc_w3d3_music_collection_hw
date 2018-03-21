require('pry-byebug')
require_relative('../album')
require_relative('../artist')

artist_1 = {
  'name' => 'Queen'
}
artist1 = Artist.new(artist_1)
artist_2 = {
  'name' => 'Pink Floyd'
}
artist2 = Artist.new(artist_2)

artist1.save()
artist2.save()

album_1 = {
  'title' => 'A Kind of Magic',
  'genre' => 'Rock',
  'artist_id' => artist1.id
}

album1 = Album.new(album_1)
album1.save()

album_2 = {
  'title' => 'Dark Side of the Moon',
  'genre' => 'Jazz',
  'artist_id' => artist2.id
}

album2 = Album.new(album_2)
album2.save()

album_3 = {
  'title' => 'The Miracle',
  'genre' => 'Pop',
  'artist_id' => artist1.id
}

album3 = Album.new(album_3)
album3.save()

album_4 = {
  'title' => 'The Division Bell',
  'genre' => 'Classical',
  'artist_id' => artist2.id
}

album4 = Album.new(album_4)
album4.save()
