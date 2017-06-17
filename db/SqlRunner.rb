require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'leeroys_pwn_shop', host: 'localhost' })
      result = db.exec( sql )
    rescue => exception
      result = exception
    ensure
      db.close
    end
    return result
  end

end