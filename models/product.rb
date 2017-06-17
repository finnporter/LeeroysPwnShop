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
    sql = "INSERT INTO products (name, quantity) VALUES ('#{name}', #{quantity}) RETURNING id;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end
  
  def self.all
    sql = "SELECT * FROM products"
    results_hash = SqlRunner.run(sql)
    return results_hash.map { |product| Product.new(product) }
  end

end