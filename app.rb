require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controllers/products_controller.rb'
require_relative 'controllers/suppliers_controller.rb'

get '/' do
  @products = Product.all.sort_by { |product| product.quantity }[0...5]
  erb(:index)
end