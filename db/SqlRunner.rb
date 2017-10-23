require( 'pg' )
require 'pry-byebug'

class SqlRunner

  def self.run( sql, values )
    begin
      db = PG.connect({ dbname: 'leeroyspwnshop', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values)
    rescue => exception
      result = exception
    ensure
      db.close
    end
    return result
  end

end