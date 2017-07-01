require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'
require_relative '../models/type.rb'

#INDEX
get '/products' do
  @products = Product.all
  erb(:"products/index")
end

#INDEX SORTED BY NAME
get '/products/by_name' do
  @products = Product.all.sort_by { |product| product.name }
  erb(:"products/by_name")
end

#INDEX SORTED BY TYPE
get '/products/by_type' do
  @products = Product.all.sort_by { |product| product.which_type.type }
  erb(:"products/by_type")
end

#INDEX SORTED BY QUANTITY
get '/products/by_quantity' do
  @products = Product.all.sort_by { |product| product.quantity }
  erb(:"products/by_quantity")
end

#INDEX SORTED BY SUPPLIER
get '/products/by_supplier' do
  @products = Product.all.sort_by { |product| product.which_supplier.name }
  erb(:"products/by_supplier")
end

#INDEX SORTED BY BUY PRICE
get '/products/by_buy_price' do
  @products = Product.all.sort_by { |product| product.buy_price }
  erb(:"products/by_buy_price")
end
#INDEX SORTED BY SELL PRICE
get '/products/by_sell_price' do
  @products = Product.all.sort_by { |product| product.sell_price }
  erb(:"products/by_sell_price")
end

#NEW
get "/products/new" do
  @suppliers = Supplier.all
  @types = Type.all
  erb(:"/products/new")
end

#DELETE
post "/products/:id/delete" do
  @product = Product.find(params["id"].to_i)
  @product.delete
  erb(:"/products/delete")
end

#SHOW
get '/products/:id' do
  @product = Product.find(params["id"].to_i)
  erb(:"products/p_details")
end

#CREATE
post "/products" do
  @products = Product.new(params)
  @products.save()
  redirect to("products")
end

#EDIT
get "/products/:id/edit" do
  @suppliers = Supplier.all
  @types = Type.all
  @product = Product.find(params["id"])
  erb(:"products/edit")
end

#UPDATE
post "/products/:id" do
  @product = Product.new(params)
  @product.update
  redirect to("products/#{params['id']}")
end
