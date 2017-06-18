require_relative '../db/SqlRunner'

class Product

  attr_accessor :name,
                :quantity
  attr_reader   :id,
                :supplier_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @quantity = options['quantity']
    @supplier_id = options['supplier_id'].to_i
  end

  def save
    sql = "INSERT INTO products (name, quantity, supplier_id) VALUES ('#{@name}', #{@quantity}, #{@supplier_id}) RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end

  def find
    sql = "SELECT * FROM products WHERE id = #{id}"
    results = SqlRunner.run(sql)
    return Product.new(results.first)
  end

  def update
    sql = "UPDATE products SET (name, quantity) = ('#{name}', #{quantity}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM products WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def which_supplier
    sql = "SELECT * FROM suppliers WHERE id = #{supplier_id}"
    results =SqlRunner.run(sql)
    supplier_data = results[0]
    supplier = Supplier.new(supplier_data)
    return supplier
  end
  
  def self.all
    sql = "SELECT * FROM products"
    results_hash = SqlRunner.run(sql)
    return results_hash.map { |product| Product.new(product) }
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end
end