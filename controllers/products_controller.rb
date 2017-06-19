require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'

#INDEX
get '/products' do
  @products = Product.all
  erb(:"products/index")
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
