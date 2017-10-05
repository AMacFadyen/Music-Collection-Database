require_relative('../db/sql_runner.rb')


class Artist
    attr_accessor :artist_name
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @artist_name = options['artist_name']
    end

    def save()
        sql = "INSERT INTO artists ( artist_name ) VALUES ( $1 ) RETURNING id;"
        values = [@artist_name]
        result = SqlRunner.run(sql, 'save_artist', values)
        @id = result[0]['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM artists;"
        values = []
        result = SqlRunner.run(sql, 'list_all_artists', values)
        return result.map { |artist| Artist.new(artist)}
    end


    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, 'get_albums', values)
        return resulta
    end
    # def self.list_info()
    #     sql = "SELECT artists.*, albums.* FROM artists INNER JOIN albums ON artists.id = albums.artists_id;"
    #     values = []
    #
    # end

    def self.delete_all()
        sql = "DELETE FROM artists"
        values = []
        result = SqlRunner.run(sql, "delete_all", values)
    end

end
