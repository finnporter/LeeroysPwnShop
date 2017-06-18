require_relative '../db/SqlRunner'
require_relative '../models/product'
require_relative '../models/supplier'

class Inventory

 def inventory_all
   product = Product.all
   supplier = Supplier.all
   return product + supplier
 end
end