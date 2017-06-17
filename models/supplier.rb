require_relative '../db/SqlRunner'

class Supplier

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end
  
  def save()
    sql = "INSERT INTO suppliers (name) VALUES ('#{name}') RETURNING id;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end
  
end