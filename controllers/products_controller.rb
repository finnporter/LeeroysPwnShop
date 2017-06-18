require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'

#INDEX
get '/products' do
  @products = Product.all
  erb(:"products/index")
end

#SHOW
get '/products/:id' do
  @product = Product.all[params["id"].to_i]
  erb(:"products/p_details")
end
