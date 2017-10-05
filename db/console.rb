require("pry")
require_relative("../models/album")
require_relative("../models/artist")

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({'artist_name' => 'Justin Vernon'})
artist1.save()

artist2 = Artist.new({'artist_name' => 'Jack Black'})
artist2.save()

artist3 = Artist.new({'artist_name' => 'Josh Homme'})
artist3.save()

album1 = Album.new({'album_name' => 'For Emma', 'genre' => 'Chill', 'artist_id' => artist1.id})
album1.save()

album2 = Album.new({'album_name' => '22, A Million', 'genre' => 'Chill', 'artist_id' => artist1.id})
album2.save()

album3 = Album.new({'album_name' => 'Tenacious D', 'genre' => 'Rock', 'artist_id' => artist2.id})
album3.save()

album4 = Album.new({'album_name' => 'Pick of Destiny', 'genre' => 'Rock', 'artist_id' => artist2.id})
album4.save()

album5 = Album.new({'album_name' => 'Like Clockwork', 'genre' => 'Rock', 'artist_id' => artist3.id})
album5.save()

album6 = Album.new({'album_name' => 'Villians', 'genre' => 'Rock', 'artist_id' => artist3.id})
album6.save()

album7 = Album.new({'album_name' => 'Songs for the Deaf', 'genre' => 'Rock', 'artist_id' => artist3.id})
album7.save()

binding.pry
nil
