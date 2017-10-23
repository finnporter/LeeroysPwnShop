require_relative '../db/SqlRunner'

class Type

  attr_accessor :type, :product_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO types (type) VALUES ('#{@type}') RETURNING *;"
    values = []
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE types SET (type) = ('#{@type}') WHERE id = #{@id}"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM types WHERE id = #{@id}"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM types"
    values = []
    results_hash = SqlRunner.run(sql, values)
    return results_hash.map { |type| Type.new(type) }
  end

  def self.delete_all
    sql = "DELETE FROM types"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM types WHERE id = #{id}"
    values = []
    results = SqlRunner.run(sql, values)
    return Type.new(results.first)
  end


end