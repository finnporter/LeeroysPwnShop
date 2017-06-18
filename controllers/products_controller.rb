require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'

get '/products' do
  @products = Product.all
  erb(:"products/index")
end