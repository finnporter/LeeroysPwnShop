require_relative '../db/SqlRunner'

class Supplier

  attr_accessor :name, :location, :picture
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
    @picture = options['picture']
  end
  
  def save()
    sql = "INSERT INTO suppliers (
      name, location, picture
      ) 
      VALUES 
      (
      $1, $2, $3
      ) 
      RETURNING id;"
    values = [@name, @location, @picture]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE suppliers SET (
      id, name, location, picture
      ) 
      = 
      (
      $1, $2, $3, $4
      ) 
      WHERE id = #{@id};"
    values = [@id, @name, @location, @picture]  
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM suppliers WHERE id = #{@id}"
    values = []
    SqlRunner.run(sql, values)
  end

  def all_products
    sql = "SELECT * FROM products WHERE supplier_id = #{@id}"
    values = []
    products_hash = SqlRunner.run(sql, values)
    product = products_hash.map { |product| Product.new(product)  }
  end

  def self.all
    sql = "SELECT * FROM suppliers"
    values = []
    results_hash = SqlRunner.run(sql, values)
    return results_hash.map { |supplier| Supplier.new(supplier) }
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM suppliers WHERE id = #{id}"
    values = []
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end
  
end