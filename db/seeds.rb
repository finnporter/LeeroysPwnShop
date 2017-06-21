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

supplier_03 = Supplier.new({
  "name" => "Bengus Deepforge",
  "location" => "Ironforge",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/458022.jpg"
  })

supplier_04 = Supplier.new({
  "name" => "Borgus Steelhand",
  "location" => "Stormwind",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/444008.jpg"
  })

supplier_05 = Supplier.new({
  "name" => "Aimee Goldforge",
  "location" => "Stormshield",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/418017.jpg"
  })

supplier_06 = Supplier.new({
  "name" => "Dwukk",
  "location" => "Durotar",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/495018.jpg"
  })

supplier_07 = Supplier.new({
  "name" => "Karn Stonehoof",
  "location" => "Thunder Bluff",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/494442.jpg"
  })

supplier_08 = Supplier.new({
  "name" => "James van Brunt",
  "location" => "Undercity",
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/36945.jpg"
  })

supplier_01.save
supplier_02.save
supplier_03.save
supplier_04.save
supplier_05.save
supplier_06.save
supplier_07.save
supplier_08.save

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

product_03 = Product.new({
  "name" => "Niskaran Morning Star",
  "quantity" => 23,
  "type_id" => type_03.id,
  "buy_price" => 17,
  "sell_price" => 23,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/629997.jpg",
  "supplier_id" => supplier_05.id
  })

product_04 = Product.new({
  "name" => "Oathseeker",
  "quantity" => 14,
  "type_id" => type_01.id,
  "buy_price" => 45,
  "sell_price" => 60,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/536532.jpg",
  "supplier_id" => supplier_06.id
  })

product_05 = Product.new({
  "name" => "Maw of the Damned",
  "quantity" => 7,
  "type_id" => type_06.id,
  "buy_price" => 232,
  "sell_price" => 270,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/537996.jpg",
  "supplier_id" => supplier_08.id
  })

product_06 = Product.new({
  "name" => "Shiv of the Uncrowned",
  "quantity" => 9,
  "type_id" => type_04.id,
  "buy_price" => 325,
  "sell_price" => 376,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/496563.jpg",
  "supplier_id" => supplier_07.id
  })

product_07 = Product.new({
  "name" => "Acid-Etched Gutripper",
  "quantity" => 2,
  "type_id" => type_04.id,
  "buy_price" => 429,
  "sell_price" => 465,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/468877.jpg",
  "supplier_id" => supplier_03.id
  })

product_08 = Product.new({
  "name" => "Molten Edge Evicerator",
  "quantity" => 12,
  "type_id" => type_04.id,
  "buy_price" => 65,
  "sell_price" => 85,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/457320.jpg",
  "supplier_id" => supplier_04.id
  })

product_09 = Product.new({
  "name" => "Ebonchill",
  "quantity" => 3,
  "type_id" => type_05.id,
  "buy_price" => 934,
  "sell_price" => 999,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/562984.jpg",
  "supplier_id" => supplier_03.id
  })

product_10 = Product.new({
  "name" => "Voidcore Greatstaff",
  "quantity" => 14,
  "type_id" => type_05.id,
  "buy_price" => 73,
  "sell_price" => 84,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/normal/496705-voidcore-greatstaff-heroic-voidcore-greatstaff.jpg",
  "supplier_id" => supplier_05.id
  })

product_11 = Product.new({
  "name" => "Wrathblade",
  "quantity" => 34,
  "type_id" => type_02.id,
  "buy_price" => 645,
  "sell_price" => 865,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/619920.jpg",
  "supplier_id" => supplier_07.id
  })

product_12 = Product.new({
  "name" => "Ashbringer",
  "quantity" => 21,
  "type_id" => type_02.id,
  "buy_price" => 64,
  "sell_price" => 85,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/537479.jpg",
  "supplier_id" => supplier_01.id
  })

product_13 = Product.new({
  "name" => "Skyhold Claymore",
  "quantity" => 11,
  "type_id" => type_02.id,
  "buy_price" => 240,
  "sell_price" => 270,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/614006.jpg",
  "supplier_id" => supplier_02.id
  })

product_14 = Product.new({
  "name" => "High-Blade of the Gorian",
  "quantity" => 6,
  "type_id" => type_02.id,
  "buy_price" => 53,
  "sell_price" => 69,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/447558.jpg",
  "supplier_id" => supplier_01.id
  })

product_15 = Product.new({
  "name" => "Howling Broadaxe",
  "quantity" => 35,
  "type_id" => type_06.id,
  "buy_price" => 13,
  "sell_price" => 24,
  "picture" => "http://wow.zamimg.com/uploads/screenshots/small/445057.jpg",
  "supplier_id" => supplier_01.id
  })


product_01.save
product_02.save
product_03.save
product_04.save
product_05.save
product_06.save
product_07.save
product_08.save
product_08.save
product_09.save
product_10.save
product_11.save
product_12.save
product_13.save
product_14.save
product_15.save



binding.pry
nil