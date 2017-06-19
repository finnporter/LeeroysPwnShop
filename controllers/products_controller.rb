require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'

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

#NEW
get "/products/add" do
  @suppliers = Supplier.all
  erb(:"/products/add")
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
  @product = Product.find(params["id"].to_i)
  erb(:edit)
end

#UPDATE
post "/products/:id" do
  product = Pizza.new(params)
  product.update
  redirect to("products/#{params["id"]}")
end
