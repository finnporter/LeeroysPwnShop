require_relative '../db/SqlRunner'
require 'pry-byebug'

class Product

  attr_accessor :name,
  :quantity,
  :buy_price,
  :sell_price,
  :picture
  attr_reader   :id,
  :supplier_id,
  :type_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @picture = options['picture']
    @supplier_id = options['supplier_id'].to_i
    @type_id = options['type_id'].to_i
  end

#INSTANCE FUNCTIONS
def save
  sql = "INSERT INTO products (
    name, quantity, buy_price, sell_price, picture, supplier_id, type_id
    ) 
    VALUES 
    (
    '#{@name}', #{@quantity}, #{@buy_price}, #{@sell_price}, '#{@picture}', #{@supplier_id}, #{@type_id}
    ) 
    RETURNING *;"

  results = SqlRunner.run(sql)
  @id = results.first['id'].to_i
end

def update
  sql = "UPDATE products SET (
    name, quantity, buy_price, sell_price, picture, supplier_id, type_id
    )
    = 
    (
    '#{@name}', #{@quantity}, #{@buy_price}, #{@sell_price}, '#{@picture}', #{@supplier_id}, #{@type_id}
    ) 
    WHERE id = #{@id};"
    
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM products WHERE id = #{@id}"
  SqlRunner.run(sql)
end

#CLASS FUNCTIONS
def self.all
  sql = "SELECT * FROM products"
  results_hash = SqlRunner.run(sql)
  return results_hash.map { |product| Product.new(product) }
end

def self.delete_all
  sql = "DELETE FROM products"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM products WHERE id = #{id}"
  results = SqlRunner.run(sql)
  return Product.new(results.first)
end

# EXTRA FUNCTIONS
def which_supplier
  sql = "SELECT * FROM suppliers WHERE id = #{supplier_id}"
  results =SqlRunner.run(sql)
  supplier_data = results[0]
  supplier = Supplier.new(supplier_data)
  return supplier
end

def which_type
  sql = "SELECT * FROM types WHERE id = #{@type_id}"
  results =SqlRunner.run(sql)
  type_data = results[0]
  type = Type.new(type_data)
  return type
end

def calculate_markup
  return (100 / @buy_price) * @sell_price
end

end