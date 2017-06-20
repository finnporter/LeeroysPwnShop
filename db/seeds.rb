require 'pry-byebug'

require_relative '../models/supplier.rb'
require_relative '../models/product.rb'

Product.delete_all
Supplier.delete_all

supplier_01 = Supplier.new({
  "name" => "Saru Steelfury",
  "location" => "Orgrimmar",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/605541.jpg"
  })

supplier_02 = Supplier.new({
  "name" => "Lalum Darkmane",
  "location" => "Mulgore",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/497116.jpg"
  })

supplier_01.save
supplier_02.save

product_01 = Product.new({
  "name" => "Iron Cleaver",
  "quantity" => 15,
  "supplier_id" => supplier_01.id
  })
product_02 = Product.new({
  "name" => "Searing Blade",
  "quantity" => 8,
  "supplier_id" => supplier_02.id
  })

product_01.save
product_02.save

binding.pry
nil