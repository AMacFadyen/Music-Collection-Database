require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album()

    attr_accessor :album_name :creator_artist
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @album_name = options['album_name']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i
    end

    def save()
        sql = "INSERT INTO albums ( album_name, genre, artist_id ) VALUES ( $1, $2, $3 ) RETURNING id;"
        values = [@album_name, @genre, @artist_id]
        result = SqlRunner.new(sql, 'save_album', values)
        @id = result[0]['id'].to_i
    end



end
