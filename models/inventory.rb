class Inventory
  
 def everything
   products = Product.all
   suppliers = Supplier.all
   everything = suppliers.concat(products)
   return everything.sort_by {|h| h[@name]}
 end
end