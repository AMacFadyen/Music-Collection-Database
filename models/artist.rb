require_relative('../db/sql_runner.rb')

class Artist
    attr_accessor :artist_name
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @artist_name = options['arist_name']
    end

    def save()
        sql = "INSERT INTO artists ( artist_id ) VALUES ( $1 ) RETURNING id;"
        values = [@artist_name]
        result = SqlRunner.new(sql, 'save_artist', values)
        @id = result[0]['id'].to_i
    end



end
