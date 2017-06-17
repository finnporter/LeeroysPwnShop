require_relative '../db/SqlRunner'

class Supplier

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end
  
  def save()
    sql = "INSERT INTO suppliers (name) VALUES ('#{@name}') RETURNING id;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end

  def find
    sql = "SELECT * FROM suppliers WHERE id = #{id}"
    results = SqlRunner.run(sql)
    return Supplier.new(results.first)
  end

  def update
    sql = "UPDATE suppliers SET (name) = ('#{name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM suppliers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def all_products
    sql = "SELECT * FROM products WHERE supplier_id = #{@id}"
    products_hash = SqlRunner.run(sql)
    product = products_hash.map { |product| Product.new(product)  }
  end

  def self.all
    sql = "SELECT * FROM suppliers"
    results_hash = SqlRunner.run(sql)
    return results_hash.map { |supplier| Supplier.new(supplier) }
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end
  
end