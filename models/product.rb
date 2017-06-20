require_relative '../db/SqlRunner'

class Product

  attr_accessor :name,
                :quantity,
                :buy_price,
                :sell_price,
                :category
  attr_reader   :id,
                :supplier_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @category = options['category']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @supplier_id = options['supplier_id'].to_i
  end

#INSTANCE FUNCTIONS
  def save
    sql = "INSERT INTO products (name, category, quantity, buy_price, sell_price, supplier_id) VALUES ('#{@name}', '#{@category}', #{@quantity}, #{@buy_price}, #{@sell_price}, #{@supplier_id}) RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end

  def update
    sql = "UPDATE products SET (name, category, quantity, buy_price, sell_price, supplier_id) = ('#{@name}', '#{@category}', #{@quantity}, #{@buy_price}, #{@sell_price}, #{@supplier_id}) WHERE id = #{@id}"
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
  def calculate_markup
    return (100 / @buy_price) * @sell_price
  end

end