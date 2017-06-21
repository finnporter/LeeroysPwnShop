require 'pry-byebug'

require_relative '../models/supplier.rb'
require_relative '../models/product.rb'
require_relative '../models/type.rb'

Product.delete_all
Supplier.delete_all
Type.delete_all

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

supplier_03

supplier_01.save
supplier_02.save

type_01 = Type.new({
  "type" => "One-handed sword"
  })

type_02 = Type.new({
  "type" => "Two-handed sword"
  })

type_03 = Type.new({
  "type" => "Mace"
  })

type_04 = Type.new({
  "type" => "Dagger"
  })

type_05 = Type.new({
  "type" => "Staff"
  })

type_06 = Type.new({
  "type" => "Axe"
  })

type_01.save
type_02.save
type_03.save
type_04.save
type_05.save
type_06.save


product_01 = Product.new({
  "name" => "Iron Cleaver",
  "quantity" => 15,
  "type_id" => type_01.id,
  "buy_price" => 12,
  "sell_price" => 23,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/99128.jpg",
  "supplier_id" => supplier_01.id
  })
product_02 = Product.new({
  "name" => "Searing Blade",
  "quantity" => 8,
  "type_id" => type_01.id, 
  "buy_price" => 34,
  "sell_price" => 45,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/394916.jpg",
  "supplier_id" => supplier_02.id
  })

product_01.save
product_02.save


binding.pry
nil