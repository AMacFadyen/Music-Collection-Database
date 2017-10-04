require("pry")
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({'artist_name' => 'Justin Vernon'})
artist1.save()

artist2 = Artist.new({'artist_name' => 'Jack Black'})
artist2.save()

artist3 = Artist.new({'artist_name' => 'Josh Homme'})
artist3.save()


binding.pry
nil
