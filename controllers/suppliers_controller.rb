require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/product.rb'
require_relative '../models/supplier.rb'

#INDEX
get '/suppliers' do
  @suppliers = Supplier.all
  erb(:"suppliers/index")
end

#NEW
get "/suppliers/add" do
  erb(:"/suppliers/add")
end

#SHOW
get '/suppliers/:id' do
  @supplier = Supplier.all[params["id"].to_i]
  @products = Product.all
  erb(:"suppliers/s_details")
end

#CREATE
post "/suppliers" do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect to("suppliers")
end