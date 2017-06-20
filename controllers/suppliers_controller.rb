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

#DELETE
post "/suppliers/:id/delete" do
  @supplier = Supplier.find(params["id"].to_i)
  @supplier.delete
  erb(:"/suppliers/delete")
end

#SHOW
get '/suppliers/:id' do
  @supplier = Supplier.find(params["id"].to_i)
  @products = @supplier.all_products
  erb(:"suppliers/s_details")
end

#CREATE
post "/suppliers" do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect to("suppliers")
end

#EDIT
get "/suppliers/:id/edit" do
  @supplier = Supplier.find(params["id"])
  erb(:"suppliers/edit")
end

#UPDATE
post "/suppliers/:id" do
  @supplier = Supplier.new(params)
  @supplier.update
  redirect to("suppliers/#{params['id']}")
end