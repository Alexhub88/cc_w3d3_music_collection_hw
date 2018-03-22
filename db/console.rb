require('pry-byebug')
require_relative('../album')
require_relative('../artist')

Album.delete_all()
Artist.delete_all()

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

artists_list = Artist.list_all()
p artists_list
puts ""

albums_list = Album.list_all()
p albums_list
puts ""

albums_by_artists_1 = artist1.list_albums_by_artist()
p albums_by_artists_1
puts ""

artist_for_album_2 = album2.show_artist_for_an_album()
p artist_for_album_2
puts ""


artist2.name = "Prince"
artist2.edit_artist()
artists_list = Artist.list_all()
p artists_list
puts ""

album3.title = "Stairway to Heaven"
album3.genre = "Funk"
album3.artist_id = artist2.id
album3.edit_album()
albums_list = Album.list_all()
p albums_list
puts ""
