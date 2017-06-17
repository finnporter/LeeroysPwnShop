require 'pry-byebug'

require_relative '../models/supplier.rb'
require_relative '../models/product.rb'

supplier_01 = Supplier.new({
  "name" => "Saru Steelfury"
  })
supplier_02 = Supplier.new({
  "name" => "Lalum Darkmane"
  })

supplier_01.save()
supplier_02.save()

product_01 = Product.new({
  "name" => "Iron Cleaver",
  "quantity" => 15
  })
product_02 = Product.new({
  "nane" => "Searing Blade",
  "quantity" => 8
  })

product_01.save()
product_02.save()

binding.pry
nil