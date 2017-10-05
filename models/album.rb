require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

    attr_accessor :album_name, :artist_id, :genre
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
        result = SqlRunner.run(sql, 'save_album', values)
        @id = result[0]['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM albums;"
        values = []
        result = SqlRunner.run(sql, 'list_all_albums', values)
        return result.map { |album| Album.new(album)}
    end

    def self.delete_all()
        sql = "DELETE FROM albums"
        values = []
        result = SqlRunner.run(sql, "delete_all", values)
    end

    def artist()
      sql = "SELECT * FROM artists WHERE id = @artist_id;"
      values = [@album_name]
      results = SqlRunner.run(sql, "get_artist", values)
      artist = results[0]
      return Artist.new(artist)
    end


  #   def artist_of_album()
  #   sql = "SELECT * FROM artists WHERE name = $1;"
  #   values = [@name]
  #   results = SqlRunner.run(sql, "artist_of_album", values)
  #   artist = results[0]
  #   return Artist.new(artist)
  # end

end
